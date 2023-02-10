local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    vim.notify('Could not load telescope')
    return
end

telescope.setup()
telescope.load_extension('dap')
