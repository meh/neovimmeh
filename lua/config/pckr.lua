local function bootstrap()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap()

local pckr = require('pckr')

pckr.setup{
  git = {
    default_url_format = 'ssh://git@github.com/%s'
  }
}

pckr.add{'Olical/nfnl'}
