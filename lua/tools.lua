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
-- local grepprg = vim.api.nvim_buf_get_option(bufnr, "grepprg")
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

function M.make(arg)
  local lines = {""}
  local winnr = vim.fn.win_getid()
  local bufnr = api.nvim_win_get_buf(winnr)

  local makeprg = api.nvim_buf_get_option(bufnr, "makeprg")
  if not makeprg then return end

  local args = vim.fn.expand(arg)
  local cmd = vim.fn.expandcmd(makeprg) .. " " .. args

  local function on_event(job_id, data, event)
    if event == "stdout" or event == "stderr" then
      if data then
        vim.list_extend(lines, data)
      end
    end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = lines,
        efm = api.nvim_buf_get_option(bufnr, "errorformat")
      })
      api.nvim_command("doautocmd QuickFixCmdPost")
    end
  end

  vim.fn.jobstart(
    cmd,
    {
      on_stderr = on_event,
      on_stdout = on_event,
      on_exit = on_event,
      stdout_buffered = true,
      stderr_buffered = true
    }
  )
end

return M
