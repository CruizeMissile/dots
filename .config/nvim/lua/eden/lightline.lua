local util = require('util')

local function setup()
  vim.g.lightline = {
    colorscheme = 'gruvbox',
    active = {
      left = {
        {'mode', 'paste'},
        {'fugitive', 'readonly', 'filename', 'modified'}
      },
      right = {
        { 'filetype', 'lspstatus', 'cocstatus', 'percent'},
      }
    },
    component = {
      lineinfo = ' %3l:%-2v',
    },
    component_type = {
      readonly = 'error',
      linter_warnings = 'warning',
      linter_errors = 'error',
    },
    component_function = {
      filename = 'eden#lightline#filename',
      readonly = 'eden#lightline#read_only',
      fugitive = 'eden#lightline#fugitive',
      cocstatus = 'coc#status',
      lspstatus = 'eden#lightline#lsp',
      currentfunction = 'CocCurrentFunction',
    },
  }

  local autocmds = {
    lightline = {
      { 'User', 'CocStatusChange,CocDiagnosticChange', [[call lightline#update()]] }
    }
  }
  util.create_augroups(autocmds)
end

return {
  setup = setup
}
