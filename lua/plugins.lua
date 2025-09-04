-- Setup lazy

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

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- vim.cmd.colorscheme("tokyonight-night")
        end,
    },
    {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
    },
    {
        "folke/tokyonight.nvim"
    },

        "windwp/nvim-autopairs",

    {
        "ellisonleao/gruvbox.nvim",
        config = function()
             vim.cmd.colorscheme("gruvbox")
            vim.cmd([[
            highlight! PmenuSel guibg=#363646 guifg=#dce8e0
            highlight! Pmenu guibg=NONE guifg=#dcd7ba

            ]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"c", "lua" , "vim", "vimdoc" , "query", "html", "python", "css", "javascript","java","cpp","bash" },

                autoinstall = true,

                highlight = {

                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    {
      "hrsh7th/nvim-cmp",         -- Main completion plugin
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",   -- LSP source
        "hrsh7th/cmp-buffer",     -- Buffer words source
        "hrsh7th/cmp-path",       -- Filesystem paths
        "hrsh7th/cmp-cmdline",    -- For command line
        "L3MON4D3/LuaSnip",       -- Snippet engine
        "saadparwaiz1/cmp_luasnip", -- Snippet source
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered({
                }),
                documentation = cmp.config.window.bordered({
                }),
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",   -- Show both symbol and text
                    maxwidth = 50,          -- Limit popup width
                    ellipsis_char = "...",  -- Show "..." for long items
                }),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })
      end,
    },
    {
        "onsails/lspkind.nvim"
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- c/c++
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            --python
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            diagnosticMode   = "workspace",
                            autoSearchPaths  = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })           
            --bash
            lspconfig.bashls.setup({
            capabilities = capabilities,
            })
            

        end,
    },

})
-- Setup nvim-autopairs
require('nvim-autopairs').setup({
  check_ts = true,  -- Enable Treesitter support for better syntax recognition
})

