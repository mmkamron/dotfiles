local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
    ["<A-m>"] = {
      function()
        require("nvterm.terminal").send("cargo run", "vertical")
      end,
      "Compile",
    }
  },
  t = {
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
    ["<A-m>"] = {
      function()
        require("nvterm.terminal").send("cargo run", "vertical")
      end,
      "Compile",
    }
  }
}

return M
