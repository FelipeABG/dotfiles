return {
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {
      disable_float_background = true,
      disable_background = true,
    }
  end,
  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme poimandres")
    vim.cmd("hi! @constructor guifg=#f1e05a")
    vim.cmd("hi! Identifier guifg=#e4f0fb")
    vim.cmd("hi! @property guifg=#e4f0fb")
    vim.cmd("hi! @boolean guifg=#d0679d")
    vim.cmd("hi! @constructor.python guifg=#7c5295")
    vim.cmd("hi! @punctuation.bracket guifg=#f1e05a")
  end
}
