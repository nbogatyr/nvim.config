-- ╭─────────────────────────────────────────────────────────╮
-- │                 Various Extra Utilities                 │
-- ╰─────────────────────────────────────────────────────────╯

return {
  -- Picker for getting sessions, CURRENTLY UNUSED
  -- Reference for this was https://github.com/LazyVim/LazyVim/pull/5443/files
  pick_sessions = function()
    local Snacks = require("snacks")
    local sessions = MiniSessions.detected

    -- Define a picker by returning a picker config
    ---@type snacks.picker.Config
    return Snacks.picker({

      -- Define the layout of the picker
      -- Don't care about preview, not relevant for sessions
      layout = {
        preset = "select",
        layout = {
          title = "Pick a session",
        },
      },

      -- Define some keys for the input window here
      win = {
        input = {
          keys = {
            ["<A-d"] = { "delete_session", mode = { "i", "n" } },
          },
        },
      },

      finder = function()
        local items = {}
        for session, sess_info in pairs(sessions) do
          items[#items + 1] = {
            file = sess_info.path,
            text = string.gsub(sess_info.name, "%%", "/"),
            original_name = sess_info.name,
            date = sess_info.modify_time,
          }
        end
        return items
      end,

      format = function(item, _)
        local ret = {}
        ret[#ret + 1] = { #ret .. ". " .. item.text }
        return ret
      end,

      -- Define what to do once inside the picker here
      actions = {
        -- If user preses <cr> on the item in the picker, do this
        confirm = function(_, item)
          MiniSessions.read(item.original_name)
        end,

        delete_session = function(_, item)
          local path = item.orig_session_file
          local session_name = item.display_name
          local choice = vim.fn.confirm("Delete '" .. session_name .. "' session?", "&Yes\n&No")
          if choice == 1 then
            vim.fn.delete(path)
            vim.notify("Deleted " .. session_name .. "' session")
            Snacks.bufdelete()
          end
        end,
      },
    })
  end,

  -- Custom function for selecting sessions that correctly displays the path
  select_sessions = function()
    local sessions = MiniSessions.detected
    local names = {}
    for k, v in pairs(sessions) do
      names[#names + 1] = v.name
    end

    vim.ui.select(names, {
      prompt = "Pick a session to load",
      format_item = function(item)
        local actual_path = string.gsub(item, "%%", "/")
        return actual_path
      end,
    }, function(item, idx)
      if item ~= nil then
        MiniSessions.read(item)
      end
    end)
  end,

  get_files_in_root = function()
    -- Get the root directory (current working directory in Neovim)
    local root_dir = vim.fn.getcwd()

    -- Define the command to run. Prefer 'fd' if available, fallback to 'rg'.
    local command
    if vim.fn.executable("fd") == 1 then
      command = string.format("fd --type f --hidden --exclude .git --color never . %s", root_dir)
    elseif vim.fn.executable("rg") == 1 then
      command = string.format("rg --files --hidden --glob '!**/.git/**' %s", root_dir)
    else
      vim.notify("Neither 'fd' nor 'rg' is available in your system.", vim.log.levels.ERROR)
      return {}
    end

    -- Run the command and capture the output
    local handle = io.popen(command)
    if not handle then
      vim.notify("Failed to execute the command.", vim.log.levels.ERROR)
      return {}
    end

    -- Read the output line by line and store it in a table
    local result = {}
    for line in handle:lines() do
      table.insert(result, line)
    end

    -- Close the handle
    handle:close()

    return result
  end,

  -- Generic function for taking async function and getting input from it synchronously
  get_async_select = function(options, prompt)
    local co = coroutine.running()
    assert(co, "must be running under a coroutine")

    vim.ui.select(options, { prompt = prompt }, function(str)
      -- (2) the asynchronous callback called when user inputs something
      coroutine.resume(co, str)
    end)

    -- (1) Suspends the execution of the current coroutine, context switching occurs
    local input = coroutine.yield()

    -- (3) return the function
    return { input = input }
  end,

  -- Generic function to start a job to execute some shell command and put the outputs into vim.notify
  execute_shell_command = function(command)
    -- Notify the user that the command is being executed
    vim.notify("Executing command: " .. command, vim.log.levels.INFO)

    -- Run the command asynchronously
    vim.fn.jobstart(command, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data and data[1] ~= "" then
          vim.notify("Command output:\n" .. table.concat(data, "\n"), vim.log.levels.INFO)
        end
      end,
      on_stderr = function(_, data)
        if data and data[1] ~= "" then
          vim.notify("Command error:\n" .. table.concat(data, "\n"), vim.log.levels.WARN)
        end
      end,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.notify("Command executed successfully.", vim.log.levels.INFO)
        else
          vim.notify("Command failed with exit code: " .. exit_code, vim.log.levels.WARN)
        end
      end,
    })
  end,

  -- Simple helper to insert some text on the same line as the cursor in the current buffer
  insert_at_start_of_line = function(text)
    -- Get the current buffer and cursor position
    local buf = 0 -- Current buffer
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1] - 1 -- Convert 1-indexed to 0-indexed

    -- Get the current line content
    local current_line = vim.api.nvim_buf_get_lines(buf, line, line + 1, false)[1]

    -- Prepend the text to the current line
    local new_line = text .. current_line

    -- Set the modified line back to the buffer
    vim.api.nvim_buf_set_lines(buf, line, line + 1, false, { new_line })
  end,

  get_python_version = function()
    local python_path = vim.g.python3_host_prog
    if not python_path or python_path == "" then
      vim.notify("Python interpreter path (vim.g.python3_host_prog) is not set.", vim.log.levels.ERROR)
      return nil
    end

    local latest_version = nil
    local handle = io.popen(python_path .. " --version 2>&1")
    if handle then
      local version_output = handle:read("*a")
      handle:close()
      latest_version = version_output:match("Python%s+([%d%.]+)")
      vim.g.python_cur_version = latest_version
      return latest_version
    else
      vim.notify("Failed to execute Python interpreter.", vim.log.levels.ERROR)
      vim.g.python_cur_version = nil
      return nil
    end
  end,
}
