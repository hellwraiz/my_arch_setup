

-- Setting up basic shortcuts -----------------------------------------------------------------------

-- for readability purposes
local newkey = vim.keymap.set
local opts = {noremap = true, silent = true}

-- random shortcuts
newkey('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
newkey('i', '<C-E>', '<Esc>', opts)
newkey('n', '<F5>', ':!xdg-open %<CR>', opts)

-- Keybinds to make splits easier. Currently UNUSED
--[[ newkey('n', '<leader>v', '<C-w>v', opts)         -- split window vertically
newkey('n', '<leader>h', '<C-w>s', opts)         -- split window horizontally
newkey('n', '<leader>=', '<C-w>=', opts)         -- split opened windows equally ]]

--  Use Alt+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
newkey('n', '<A-h>', ':TmuxNavigateLeft<CR>', opts)
newkey('n', '<A-l>', ':TmuxNavigateRight<CR>', opts)
newkey('n', '<A-j>', ':TmuxNavigateDown<CR>', opts)
newkey('n', '<A-k>', ':TmuxNavigateUp<CR>', opts)

-- keybinds to make buffer navigation easier.
newkey('n', '<leader>bn', ':bn<CR>', opts)
newkey('n', '<leader>bp', ':bp<CR>', opts)
newkey('n', '<leader>bx', ':bd<CR>', opts)
newkey('n', '<leader>bd', ':BufferLinePickClose<CR>', opts)
newkey('n', '<leader>bcc', ':BufferLineCloseOthers<CR>')
newkey('n', '<leader>bcl', ':BufferLineCloseLeft<CR>')
newkey('n', '<leader>bcr', ':BufferLineCloseRight<CR>')

-- save 'n quit
newkey('n', '<leader>q', ':qa!<CR>', opts)
newkey('n', '<leader>W', ':wqa<CR>', opts)
newkey('n', '<leader>x', ':close<CR>', opts)
newkey('n', '<leader>w', ':w<CR>', opts)


-- Unused shortcuts -------------------------------------------------------------------------------

-- Keybinds to make tab navigation easier.
newkey('n', '<leader>to', ':tabnew %<CR>', opts)    -- create a new tab
newkey('n', '<leader>tx', ':tabclose<CR>', opts)  -- close the current tab
newkey('n', '<leader>tp', ':tabp<CR>', opts)      -- go to previous tab
newkey('n', '<leader>tn', ':tabn<CR>', opts)      -- go to next tab


-- LSP shortcuts ----------------------------------------------------------------------------------

-- Default values

-- Buffer
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "grt" is mapped in Normal mode to vim.lsp.buf.type_definition()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

-- Diagnostic
-- `]d` jumps to the next diagnostic in the buffer. ]d-default
-- `[d` jumps to the previous diagnostic in the buffer. [d-default
-- `]D` jumps to the last diagnostic in the buffer. ]D-default
-- `[D` jumps to the first diagnostic in the buffer. [D-default
-- `<C-w>d` shows diagnostic at cursor in a floating window. CTRL-W_d-default

-- Keybinds for :h vim.lsp.buf
-- newkey('n', '<leader>ca', vim.lsp.buf.code_action, opts) REPLACED IN pretty_lsp_diagnostics.lua
newkey('n', '<leader>r', vim.lsp.buf.references, opts)
newkey('n', '<leader>d', vim.lsp.buf.definition, opts)
newkey('n', '<leader>t', vim.lsp.buf.type_definition, opts)
newkey('n', '<leader>i', vim.lsp.buf.implementation, opts)
newkey('n', '<leader>s', vim.lsp.buf.document_symbol, opts) -- to see all funcs and vars
newkey('n', '<leader>S', vim.lsp.buf.workspace_symbol, opts) -- to see all funcs and vars
newkey('n', '<leader>ic', vim.lsp.buf.incoming_calls, opts) -- for func calls
newkey('n', '<leader>oc', vim.lsp.buf.outgoing_calls, opts) -- for funcs this func calls
newkey('n', '<leader>rn', vim.lsp.buf.rename, opts)
newkey('n', 'K', vim.lsp.buf.hover, opts)
