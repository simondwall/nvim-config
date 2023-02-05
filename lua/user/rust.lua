local rust_tools_status_ok, rust_tools = pcall(require, 'rust-tools')
if not rust_tools_status_ok then
    vim.notify('Could not load rust-tools')
    return
end

rust_tools.setup()
