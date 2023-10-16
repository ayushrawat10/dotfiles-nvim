local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  --go
  b.formatting.gofmt,
  -- c/c++
  b.formatting.clang_format,
  b.formatting.clang_format.with {
    extra_args = { "-style=file" },
  },

  -- python
  b.formatting.black,

  -- rust
  b.formatting.rustfmt,
  -- Lua
  b.formatting.stylua,

  -- linters
  b.formatting.eslint_d,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     vim.api.nvim_clear_autocmds {
  --       group = augroup,
  --       buffer = bufnr,
  --     }
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format { bufnr = bufnr }
  --       end,
  --     })
  --   end
  -- end,
}

-- local null_ls = require "null-ls"
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- local b = null_ls.builtins
--
-- local opts = {
--   sources = {
--
--     -- webdev stuff
--     b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
--     b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
--     --go
--     b.formatting.gofumpt,
--     b.formatting.goimports_reviser,
--     b.formatting.golines,
--     -- c/c++
--     b.formatting.clang_format.with {
--       extra_args = { "-style=file" },
--     },
--
--     -- python
--     b.formatting.black,
--
--     -- rust
--     b.formatting.rustfmt,
--     -- Lua
--     b.formatting.stylua,
--
--     -- linters
--     b.formatting.eslint_d,
--   },
--
--   on_attach = function(client, bufnr)
--         if client.supports_method "textDocument/formatting" then
--           vim.api.nvim_clear_autocmds {
--          group = augroup,
--              buffer = bufnr,
--       }
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format { bufnr = bufnr }
--         end,
--       })
--     end
--   end,
-- }
--
-- return opts
