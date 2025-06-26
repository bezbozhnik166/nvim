vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true 
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.expandtab = true 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.opt.pumheight = 10 
vim.o.cursorline = true
vim.opt.hlsearch = true 
vim.keymap.set("n","<esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v","<leader>d",'"_d',{noremap = true, silent=true})
vim.keymap.set("n","<leader>dd",'"_dd',{noremap = true, silent=true})
vim.keymap.set("n","<leader>diw",'"_diw',{noremap = true, silent=true})
vim.keymap.set("n","<leader>D",'"_D',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di{",'"_di{',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di}",'"_di}',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di]",'"_di]',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di[",'"_di[',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di)",'"_di)',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di(",'"_di(',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di<",'"_di<',{noremap = true, silent=true})
vim.keymap.set("n","<leader>di>",'"_di>',{noremap = true, silent=true})
vim.keymap.set("n",'<leader>di"','"_di"',{noremap = true, silent=true})
