local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    vim.notify('Could not load dap')
    return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    vim.notify('Could not load dapui')
    return
end

dapui.setup({
    layouts = {
        {
            elements = {
                {
                    id = "watches",
                    size = 1.0
                }
            },
            position = "left",
            size = 40
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 1.0
                },
            },
            position = "bottom",
            size = 10
        }
    },
})

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/Users/simondawall/.local/share/nvim/mason/packages/codelldb/codelldb',
        args = { "--port", "${port}" },
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
    },
}

dap.adapters.debugpy = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/Users/simondawall/.local/share/nvim/mason/bin/debugpy-adapter',
        args = { "--port", "${port}" }
    }
}

dap.configurations.python = {
    {
        name = "Launch file",
        type = "debugpy",
        request = "launch",
        program = function()
            return vim.fn.input('Path to python file: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
    }
}

dap.adapters.delve = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/Users/simondawall/.local/share/nvim/mason/bin/dlv',
        args = { "dap", "--listen", "127.0.0.1:${port}" }
    }
}

dap.configurations.go = {
    {
        name = "Launch",
        type = "delve",
        request = "launch",
        program = function()
            return vim.fn.input('Path to file: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
    }
}
