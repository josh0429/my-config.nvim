-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- gitsigns
  -- See `:help gitsigns` to understand what the configuration keys do
  require('JoshuaB.plugins.gitsigns'),

  --vim-tmux-navigator
  require('JoshuaB.plugins.tmux-navigator'),

  -- which-key
  require('JoshuaB.plugins.which-key'),

  -- telescope
  require('JoshuaB.plugins.telescope'),

  -- vimtex
  require('JoshuaB.plugins.vimtex'),

  -- LSP Plugins
  require('JoshuaB.plugins.lspconfig'),

  -- Autocomplete
  require('JoshuaB.plugins.cmp'),

  -- Colorscheme
  require('JoshuaB.plugins.tokyonight'),

  -- Highlight todo, notes, etc in comments
  require('JoshuaB.plugins.todo-comments'),

  -- Collection of various small independent plugins/modules
  require('JoshuaB.plugins.mini'),

  -- treesitter
  require('JoshuaB.plugins.treesitter'),

  -- harpoon
  require('JoshuaB.plugins.harpoon'),

}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
-- vim: ts=2 sts=2 sw=2 et
