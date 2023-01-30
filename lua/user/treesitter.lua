local config_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not config_status_ok then
    vim.notify('Could not load treesitter.config')
    return
end

configs.setup({
    ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
    rainbow = {
        enable = true,
        extended_mode = true,
    }
})
