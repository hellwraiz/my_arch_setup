


-- Stuff that needs to happen at the start --------------------------------------------------------

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require ("lazyConfig") -- import lazy config file
require ("config.keymaps") -- import all my keymaps



-- Setting up the variables -----------------------------------------------------------------------

-- Searching and splitting
vim.opt.showmatch = true        -- Whether we show matching before we are done searching or not
vim.opt.ignorecase = true       -- Whether we ignore case or not while searching
vim.opt.smartcase = true        -- If true won't ignore case when searching using capital letters. Or using \C or something
vim.opt.inccommand = 'split'

-- I/O
vim.opt.mouse = 'a'             -- Which mode we are allowed to use a mouse in

-- Changes to GUI
vim.opt.number = true           -- To use numbers on the left or not to
vim.opt.relativenumber = true   -- To see relative numbers from your position
vim.opt.signcolumn = 'yes'      -- Enables sign columns that can show some status thing or something?
-- vim.opt.cc = '100'           -- This adds a vertical line at that column to be used as a reference during programming
vim.opt.splitright = true       -- make new split appear to the right instead of to the left
vim.opt.splitbelow = true       -- make new split appear below instead of above
vim.opt.list = true             -- Sets neovim to show trailing white spaces, tabs and non-breakable spaces
vim.opt.listchars = {           -- Sets how neovim will display certain whitespace characters in the editor.
tab = '» ', trail = '·', nbsp = '␣' }


-- Changes to typing
vim.opt.scrolloff = 5          -- so that your cursor doesn't get too close to the window border before moving it
-- vim.opt.cursorline = true    -- shows the current position of the cursor
vim.opt.completeopt = {         -- Used to configure the behaviour of the suggestion menu
'menu', 'menuone', 'noselect' }
vim.opt.timeoutlen = 450        -- when a keybind is used so it doesn't wait too long before using it
vim.opt.ttimeoutlen = 10        -- when a terminal keybind is used so it doesn't wait too long before using it

-- Saving
vim.opt.updatetime = 1000       -- Makes it so that we write to disk more often
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

-- <Tab>s 'n shiet
vim.opt.tabstop = 4             -- How many spaces are in a tabstop
vim.opt.expandtab = true        -- To use tab appropriately in insert mode and using < and >
vim.opt.shiftwidth = 4          -- How many spaces to use for autoindent and << or >>
vim.opt.softtabstop = 4         -- How many stpaces that a <Tab> counts for while editing. Helps with mixing tabs and spaces
vim.opt.breakindent = true      -- Makes warped lines visually indented

-- Setting the colourscheme and some transparency settings
vim.cmd([[set fillchars=eob:\ ]]) -- set global fillchars so EOB (end-of-buffer) is just a space (hides ~)
vim.o.background = 'dark' -- or "light" for light mode
vim.cmd.colorscheme('gruvbox')
vim.opt.termguicolors = true



-- Functions and commands -------------------------------------------------------------------------

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- so that I don't see the irritating » symbol everywhere in go files.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.list = false
  end,
})

