-- ╭─────────────────────────────────────────────────────────╮
-- │                 Various Extra Functions                 │
-- ╰─────────────────────────────────────────────────────────╯
return {
  -- Picker for getting sessions
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
      MiniSessions.read(item)
    end)
  end,
}
