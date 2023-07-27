local command = vim.api.nvim_create_user_command

local deleteCurrentBuffer = function()
    local cBuf = vim.api.nvim_get_current_buf()
    local bufs = vim.fn.getbufinfo({buflisted = true})
    if #bufs == 0 then return end
    for idx, b in ipairs(bufs) do
        if b.bufnr == cBuf then
            if idx == #bufs then
                vim.cmd("bprevious")
            else
                vim.cmd("bnext")
            end
            break
        end
    end
    vim.cmd("write")
    vim.cmd(string.format("bdelete %s", cBuf))
end

command("DeleteCurrentBuffer", deleteCurrentBuffer,
        {desc = "Cerrando current buffer e ir al siguiente buffer"})
