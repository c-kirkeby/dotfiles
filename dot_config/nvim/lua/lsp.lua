vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true, noremap = true }

    local snacks = require("snacks")

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", function()
      snacks.picker.lsp_references(opts)
    end, opts)

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

    vim.keymap.set("n", "<leader>r", function()
      local cmdId
      cmdId = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
        callback = function()
          local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
          vim.api.nvim_feedkeys(key, "c", false)
          vim.api.nvim_feedkeys("0", "n", false)
          cmdId = nil
          return true
        end,
      })
      vim.lsp.buf.rename()
      vim.defer_fn(function()
        if cmdId then
          vim.api.nvim_del_autocmd(cmdId)
        end
      end, 500)
    end, opts)

    -- For enabling native textDocument/codeLens features in lsp that support
    -- them. Currently a work in progress.
    local codelens = {
      enabled = false,
    }

    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if codelens.enabled then
      if client and client:supports_method("textDocument/codeLens") then
        vim.lsp.codelens.refresh()
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          buffer = bufnr,
          callback = vim.lsp.codelens.refresh,
        })
      end
    end

    -- Native copilot-lsp completions for neovim 0.12

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

      vim.keymap.set(
        "i",
        "<C-F>",
        vim.lsp.inline_completion.get,
        { desc = "LSP: accept inline completion", buffer = bufnr }
      )
      vim.keymap.set(
        "i",
        "<C-G>",
        vim.lsp.inline_completion.select,
        { desc = "LSP: switch inline completion", buffer = bufnr }
      )
    end
  end,
})

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
