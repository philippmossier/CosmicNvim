local u = require('cosmic.utils')
local defaults = require('cosmic.lsp.providers.defaults')
local null_ls = require('null-ls')
local config = require('cosmic.core.user')

local config_opts = config.lsp.servers.null_ls or {}

-- how to disable sources?

-- if config_opts.default_cosmic_sources then -- comment out this line (bug)
  config_opts.sources = u.merge_list({
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.prettierd.with({
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
      },
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
  }, config_opts.sources or {})
-- end -- comment out this line (bug)

require('null-ls').setup(u.merge(defaults, config_opts))
