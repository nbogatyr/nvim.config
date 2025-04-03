-- ╭─────────────────────────────────────────────────────────╮
-- │              Snacks.picker Custom Configs               │
-- ╰─────────────────────────────────────────────────────────╯

-- Function to find all sessions in the default sessions storage directory
local function get_sessions()
  local sessions = {}
  local sessions_storage = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/")
  local handle = io.popen("fd . " .. sessions_storage)

  if handle then
    for line in handle:lines() do
      table.insert(sessions, line)
    end
    handle:close()
  else
    vim.notify("Failed to find any files in sessions storage directory")
  end

  return sessions
end

-- Picker for getting sessions
-- Reference for this was https://github.com/LazyVim/LazyVim/pull/5443/files
local function pick_sessions()
  local Snacks = require("snacks")
  local sessions = get_sessions()

  -- Define a picker by returning a picker config
  ---@type snacks.picker.Config
  return Snacks.picker({

    -- Define the layout of the picker
    -- Don't care about preview, not relevant for sessions
    layout = {
      layout = {
        box = "horizontal",
        width = 0.8,
        height = 0.8,
        {
          box = "vertical",
          border = "rounded",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
          title = "Session Picker",
        },
      },
    },

    -- Define some keys for the input window here
    win = {
      input = {
        keys = {
          ["<M-c"] = { "delete_session", mode = { "i", "n" } },
        },
      },
    },

    -- Calls get_sessions(), then splits the session filename into consituent parts
    finder = function()
      local items = {}
      for i, session in ipairs(sessions) do
        -- Get the basename
        local basename = session:match("([^/]+)$")

        -- Break apart the dir name and branch if necessary
        local dir, branch = unpack(vim.split(basename, "@@", { plain = true }))

        -- NOTE: Not all session files have a branch name in them
        if branch ~= nil then
          branch = branch:match("(.+)%.%w+$") or branch
        end

        -- Just in case, remove file ending, and replace % with /
        dir = dir:match("(.+)%.%w+$") or dir
        dir = dir:gsub("%%", "/")

        -- Format the display name in the picker
        local session_display_name
        if branch then
          session_display_name = dir .. " (" .. branch .. ")"
        else
          session_display_name = dir
        end

        items[#items + 1] = {
          file = dir,
          text = dir,
          dir = dir,
          branch = branch,
          orig_session_file = session,
          display_name = session_display_name,
        }
      end
      return items
    end,

    format = function(item, _)
      local ret = {}
      local display_name = item.display_name
      ret[#ret + 1] = { display_name }
      return ret
    end,

    -- Define what to do once inside the picker here
    actions = {
      -- If user preses <cr> on the item in the picker, do this
      confirm = function(_, item)
        -- TODO: Handle branch names, if they appear
        vim.notify("Opening Session " .. item.dir)
        vim.fn.chdir(item.dir)
        require("persisted").load()
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
end

-- Add custom keybinds for the pickers
-- vim.keymap.set("n", "<leader>fs", function()
--   pick_sessions()
-- end, { desc = "Find Sessions" })
