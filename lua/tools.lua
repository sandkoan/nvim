if vim.fn.executable("rg") then
    local M = {}
    local loop = vim.loop
    local api = vim.api
    local results = {}
    local function onread(err, data)
        if err then
            -- print('ERROR: ', err)
            -- TODO: handle err
        end
        if data then
            local vals = vim.split(data, "\n")
            for _, d in pairs(vals) do
                if d == "" then goto continue end
                table.insert(results, d)
                ::continue::
            end
        end
    end
    local function setQF()
        vim.fn.setqflist({}, 'r', {title = 'Search Results', lines = results})
        api.nvim_command('cwindow')
        local count = #results
        for i=0, count do results[i]=nil end -- clear the table for the next search
    end
    local function setLL()
        vim.fn.setloclist({}, 'r', {title = 'Search Results', lines = results})
        api.nvim_command('lwindow')
        local count = #results
        for i=0, count do results[i]=nil end -- clear the table for the next search
    end
    function M.asyncGrep(term)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        handle = vim.loop.spawn('rg', {
                args = {term, '--vimgrep', '--smart-case', '--no-heading'},
                stdio = {stdout,stderr}
            },
            vim.schedule_wrap(function()
                    stdout:read_stop()
                    stderr:read_stop()
                    stdout:close()
                    stderr:close()
                    handle:close()
                    setQF()
                end
            )
        )
        vim.loop.read_start(stdout, onread)
        vim.loop.read_start(stderr, onread)
    end
    function M.asyncLgrep(term)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        handle = vim.loop.spawn('rg', {
                args = {term, '--vimgrep', '--smart-case', '--no-heading'},
                stdio = {stdout,stderr}
            },
            vim.schedule_wrap(function()
                    stdout:read_stop()
                    stderr:read_stop()
                    stdout:close()
                    stderr:close()
                    handle:close()
                    setLL()
                end
            )
        )
        vim.loop.read_start(stdout, onread)
        vim.loop.read_start(stderr, onread)
    end
    return M
end
