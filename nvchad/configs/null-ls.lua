local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local mason_null_ls = require "mason-null-ls"

null_ls.setup {
  temp_dir = "/tmp",
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),
    -- null_ls.builtins.diagnostics.phpstan, -- TODO: Only if config file
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", "eslint.config.mjs" })
      end,
    }),
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.js", "prettier.config.js" })
      end,
    }),
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
        end,
      })
    end
  end,
}

mason_null_ls.setup {
  automatic_installation = true
}

-- Commands
vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

-- Diagnostic configuration
vim.diagnostic.config {
  virtual_text = false,
  float = {
    source = true,
  }
}
