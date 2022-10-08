local comment_status_ok, comment = pcall(require, 'nvim_comment')
if not comment_status_ok then
    vim.notify('Could not load nvim_comment')
    return
end

comment.setup()

local surround_status_ok, surround = pcall(require, 'nvim-surround')
if not surround_status_ok then
    vim.notify('Could not load nvim-surround')
    return
end

surround.setup()
