---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.dap = {
  plugin = true,
  n = {

    ["<F5>"] = { ":lua require'dap'.continue()<CR>", "DAP Continue" },
    ["<F10>"] = { ":lua require'dap'.step_over()<CR>", "DAP Step over" },
    ["<F11>"] = { ":lua require'dap'.step_into()<CR>", "DAP Step into" },
    ["<F12>"] = { ":lua require'dap'.step_out()<CR>", "DAP Step out" },
    ["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "DAP Toggle Breakpoint" },
    ["<leader>B"] = {
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "DAP Set Breakpoint condition",
    },
    ["<leader>lp"] = {
      ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      "Log Point Message",
    },
    ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "Repl Open" },
    ["<leader>dus"] = { ":lua require'dap'.ui.toggle()<CR>", "DAP UI Toggle" },
    ["<leader>dl"] = { ":lua require'dap'.run_last()<CR>", "DAP Run Last" },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dap-go").debut_test()
      end,
      "Debug Go test",
    },
    ["<leader>dl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug Last",
    },
  },
}

M.codeium = {
  plugin = true,
  i = {
    ["<C-P>"] = {
      function()
        require("codeium").CycleCompletions(-1)
      end,
    },
    ["<C-N>"] = {
      function()
        require("codeium").CycleCompletions(1)
      end,
    },
    ["<C-s>"] = {
      function()
        require("codeium").Accept()
      end,
    },
    ["<C-c>"] = {
      function()
        require("codeium").Clear()
      end,
    },
    ["<C-q>"] = {
      function()
        require("codeium").Complete()
      end,
    },
  },
}

-- more keybinds!

return M
