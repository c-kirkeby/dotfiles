local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/schemastore.nvim",
    "Saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          "lazy.nvim",
        },
      },
    },
    -- "nvimtools/none-ls.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to definition"
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

      opts.desc = "Go to declaration"
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Go to type definition"
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.type_definition, opts)

      opts.desc = "LSP Hover"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "LSP Signature Help"
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

      opts.desc = "Code Actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      -- Set up additional on_attach

      vim.keymap.set("n", "<leader>r", function()
        -- when rename opens the prompt, this autocommand will trigger
        -- it will "press" CTRL-F to enter the command-line window `:h cmdwin`
        -- in this window I can use normal mode keybindings
        local cmdId
        cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
          callback = function()
            local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
            vim.api.nvim_feedkeys(key, "c", false)
            vim.api.nvim_feedkeys("0", "n", false)
            -- autocmd was triggered and so we can remove the ID and return true to delete the autocmd
            cmdId = nil
            return true
          end,
        })
        vim.lsp.buf.rename()
        -- if LPS couldn't trigger rename on the symbol, clear the autocmd
        vim.defer_fn(function()
          -- the cmdId is not nil only if the LSP failed to rename
          if cmdId then
            vim.api.nvim_del_autocmd(cmdId)
          end
        end, 500)

        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.inlay_hint.enable(true, {
        --     bufnr,
        --   })
        -- end
      end, opts)
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
      },
    })

    -- Language servers with default settings
    local servers = {
      "emmet_ls",
      "yamlls",
      "html",
      "cssls",
      "svelte",
      "eslint",
      "sqlls",
      "tailwindcss",
      "basedpyright",
      "phpactor",
      "astro",
      "lua_ls",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Language Servers with non-default settings

    lspconfig.omnisharp.setup({
      cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })

    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
}

return M
