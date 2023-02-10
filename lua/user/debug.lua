local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    vim.notify('Could not load dap')
    return
end

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/Users/simondawall/.local/share/nvim/mason/packages/codelldb/codelldb',
        args = {"--port", "${port}"},
    }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    -- stopOnEntry = false,
  },
}
