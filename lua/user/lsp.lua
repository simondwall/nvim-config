local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
    vim.notify('Could not load mason')
    return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
    vim.notify('Could not load mason-lspconfig')
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
    vim.notify('Could not load lspconfig')
    return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { 'sumneko_lua', 'rust_analyzer', 'svelte', 'gopls', 'html-lsp', 'json-lsp',
        'yaml-language-server', 'python-lsp-server', 'marksman', 'css-lsp'
    }
})

lspconfig.sumneko_lua.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
lspconfig.rust_analyzer.setup({})
lspconfig.svelte.setup({})
lspconfig.gopls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.yamlls.setup({})
lspconfig.pylsp.setup({})
lspconfig.marksman.setup({})
lspconfig.cssls.setup({})
