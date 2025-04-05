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

  vim.ui.select(options, {prompt = prompt}, function(str)
    -- (2) the asynchronous callback called when user inputs something
    coroutine.resume(co, str)
  end)

  -- (1) Suspends the execution of the current coroutine, context switching occurs
  local input = coroutine.yield()

  -- (3) return the function
  return { input = input }
end





}


