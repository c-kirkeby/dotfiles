local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "williamboman/mason.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>dB",
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')<CR>",
      desc = "Breakpoint Condition",
    },
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>",             desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>lua require('dap').continue()<CR>",                      desc = "Run/Continue" },
    { "<leader>da", "<cmd>lua require('dap').continue({ before = get_args })<CR>", desc = "Run with Args" },
    { "<leader>dC", "<cmd>lua require('dap').run_to_cursor()<CR>",                 desc = "Run to Cursor" },
    { "<leader>dg", "<cmd>lua require('dap').goto_()<CR>",                         desc = "Go to Line (No Execute)" },
    { "<leader>di", "<cmd>lua require('dap').step_into()<CR>",                     desc = "Step Into" },
    { "<leader>dj", "<cmd>lua require('dap').down()<CR>",                          desc = "Down" },
    { "<leader>dk", "<cmd>lua require('dap').up()<CR>",                            desc = "Up" },
    { "<leader>dl", "<cmd>lua require('dap').run_last()<CR>",                      desc = "Run Last" },
    { "<leader>do", "<cmd>lua require('dap').step_out()<CR>",                      desc = "Step Out" },
    { "<leader>dO", "<cmd>lua require('dap').step_over()<CR>",                     desc = "Step Over" },
    { "<leader>dP", "<cmd>lua require('dap').pause()<CR>",                         desc = "Pause" },
    { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>",                   desc = "Toggle REPL" },
    { "<leader>ds", "<cmd>lua require('dap').session()<CR>",                       desc = "Session" },
    { "<leader>dt", "<cmd>lua require('dap').terminate()<CR>",                     desc = "Terminate" },
    { "<leader>dw", "<cmd>lua require('dap.ui.widgets').hover()<CR>",              desc = "Widgets" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local virtual_text = require("nvim-dap-virtual-text")
    dapui.setup()
    virtual_text.setup({
      enabled = true,
    })

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = "js-debug-adapter",
        args = {
          "${port}",
        },
      },
    }

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          sourceMaps = true,
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
      }
    end

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}

return M
