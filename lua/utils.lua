-- Inspired by https://teukka.tech/luanvim.html

local M = {}
local api = vim.api

function M.blameVirtText()
    if vim.bo.readonly == true or vim.bo.modifiable == false then
        return
    end

    local ft = vim.bo.filetype
    if ft == '' or ft == 'bin' or ft == 'qf' or ft == 'll' then
        return
    end
 -- clear out virtual text from namespace 2 (the namespace we will set later)
    api.nvim_buf_clear_namespace(0, 2, 0, -1)

    local currfile = vim.fn.expand('%')
    local line = api.nvim_win_get_cursor(0)
    local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currfile))
    local hash = vim.split(blame, '%s')[1]
    local cmd = string.format("git show %s ", hash).."--format='%an | %ar | %s'"

    if hash == '00000000' then
        text = 'Not Committed Yet'
    else
        text = vim.fn.system(cmd)
        text = vim.split(text, '\n')[1]
        if text:find("fatal") then
            return
        end

        local gituser = vim.fn.system("git config user.name")
        if text:find(gituser) then
            _, text = text:gsub(gituser, "You")
        end
    end

    api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{ text,'GitLens' }}, {}) -- set virtual text for namespace 2 with the content from git and assign it to the higlight group 'GitLens'
end

 -- important for clearing out the text when our cursor moves
function M.clearBlameVirtText()
    api.nvim_buf_clear_namespace(0, 2, 0, -1)
end

return M
