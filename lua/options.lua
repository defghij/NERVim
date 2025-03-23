local opt = vim.opt
opt.encoding = "utf-8"
opt.expandtab = true
opt.virtualedit = "all"
opt.nu = true
opt.errorbells = false
opt.wrap = true
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.autoindent = true
opt.hlsearch = true
opt.completeopt = "menu,menuone,noselect"
opt.sw = 2
opt.ts = 2
opt.sts = 2
opt.fillchars = {eob = " "}
opt.cmdheight = 0


vim.o.signcolumn = "yes:1"
vim.o.background = "dark"

-- Spelling
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- ~/.config/nvim/
--   |-- spell
--   |    |-- en.utf-8.add
--   |    |-- en.utf-8.add.spl
-- 
-- The .add file is a list of words you’ve added. For example, my .add file has tech words like “Kubernetes” which don’t typically appear in the default English dictionary.
-- 
-- The .spl file is a compiled binary “spellfile”. And it’s what is used to actually make suggestions and crawl the dictionary graph. Creating spellfiles is … rather involved. But, for most people, simply using zg to mark “good” words gets you 99% of the way there.



vim.opt.runtimepath:append("~/.config/nvim/keymap")  -- Ensure the folder is searched
vim.opt.keymap = "kana"  -- Load kana.vim
vim.opt.iminsert = 0      -- Start with English input mode
vim.opt.imsearch = 0      -- Default search in English

