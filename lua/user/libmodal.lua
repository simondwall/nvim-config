local libmodal_status_ok, libmodal = pcall(require, 'libmodal')
if not libmodal_status_ok then
    vim.notify('Could not load libmodal')
    return
end

local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
    vim.notify('Could not load dap for libmodal')
    return
end

local dapui_status_ok, dapui = pcall(require, 'dapui')
if not dapui_status_ok then
    vim.notify('Could not load dapui for libmodal')
    return
end

DebugLayer = libmodal.layer.new({
    n = {
        b = {
            rhs = dap.toggle_breakpoint,
            noremap = true,
        },
        c = {
            rhs = dap.continue,
            noremap = true,
        },
        s = {
            rhs = dap.step_over,
            noremap = true,
        },
        i = {
            rhs = dap.step_into,
            noremap = true,
        },
        o = {
            rhs = dap.step_out,
            noremap = true,
        },
        z = {
            rhs = dap.step_back,
            noremap = true,
        },
        r = {
            rhs = dap.run_to_cursor,
            noremap = true,
        },
        J = {
            rhs = '<C-w>j',
            noremap = true,
        },
        K = {
            rhs = '<C-w>k',
            noremap = true,
        },
        L = {
            rhs = '<C-w>l',
            noremap = true,
        },
        H = {
            rhs = '<C-w>h',
            noremap = true,
        }
    }
})

DebugLayer:map("n", "<Esc>", function()
    DebugLayer:exit()
    print("-- NORMAL --")
    dapui.close()
end, {})

function EnterDebugMode()
    DebugLayer:enter()
    print("-- DEBUG --")
    dapui.open()
end
