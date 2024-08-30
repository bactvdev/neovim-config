return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
  },
  config = function()
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#FF0000", bg = "" }) -- Red foreground for the circle
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#FFFB00", bg = "" }) -- Green foreground for the arrow

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
    )

    local dap = require "dap"
    local dapui = require "dapui"

    dapui.setup {}
    require("dap-go").setup {}

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
