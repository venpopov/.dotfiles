-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", ":Vex<CR>", { silent = true})

vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.opt.autoindent = true
vim.opt.scrolloff = 8
vim.wo.relativenumber = true
vim.opt.cc = "120"
vim.opt.syntax = on
vim.opt.signcolumn = yes

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"},
{
  callback = function()
    local separator = " ▎ "
    vim.opt.statuscolumn =
    '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr3#%{(v:relnum == 3)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr2#%{(v:relnum == 2)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr1#%{(v:relnum == 1)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr0#%{(v:relnum == 0)?v:lnum.\" ' .. separator .. '\":\"\"}'

    vim.cmd("highlight LineNr0 guifg=#dedede")
    vim.cmd("highlight LineNr1 guifg=#bdbdbd")
    vim.cmd("highlight LineNr2 guifg=#9c9c9c")
    vim.cmd("highlight LineNr3 guifg=#7b7b7b")
    vim.cmd("highlight LineNr4 guifg=#5a5a5a")
  end
})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
   { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
