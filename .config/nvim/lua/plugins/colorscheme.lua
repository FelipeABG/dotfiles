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

  init = function()
    vim.cmd("colorscheme poimandres")
    vim.cmd("hi! Identifier guifg=#e4f0fb")
    vim.cmd("hi! @property guifg=#e4f0fb")
    vim.cmd("hi! @boolean guifg=#d0679d")
    vim.cmd("hi! @constructor guifg=#fffac2")
    vim.cmd("hi! @constructor.python guifg=#89ddff")
    vim.cmd("hi! @punctuation.bracket guifg=#fffac2")
    vim.cmd("hi! MatchParen guibg=# guifg=#E2C6F3")
    vim.cmd("hi! FloatBorder guifg=#303340")
    vim.cmd("hi! @lsp.typemod.class.public.java guifg=#5fb3a1")
    vim.cmd("hi! @keyword.import guifg=#fea0c4")
  end
}
