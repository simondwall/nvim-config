local whichkey_status_ok, whichkey = pcall(require, 'which-key')
if not whichkey_status_ok then
    vim.notify('Could not load which-key')
end

whichkey.setup({
    plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false,    -- misc bindings to work with windows
            z = false,      -- bindings for folds, spelling and others prefixed with z
            g = false,      -- bindings for prefixed with g
        },
    },
    ignore_missing = true,
    window = {
        border = "single",
        margin = { 1, 50, 1, 50 },
    },
    layout = {
        height = { min = 1, max = 25 }, -- min and max height of the columns
        align = "left",                 -- align columns left, center or right
    }
})

whichkey.register({
    l = {
        name = "Language Server",
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    },
    t = {
        name = "Telescope",
        d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
    },
    d = { "<cmd>lua EnterDebugMode()<cr>", "Debug Mode" }
}, { prefix = "<leader>" })
