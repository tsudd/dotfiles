return {
  {
    "nickjvandyke/opencode.nvim",
    lazy = false,
    version = "*",
    dependencies = {},
    config = function()
      local opencode = require("opencode")

      --@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
      }

      -- Handle `opencode` events
      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:*", -- Optionally filter event types
        callback = function(args)
          ---@type opencode.server.Event
          local event = args.data.event
          ---@type number
          local port = args.data.port

          -- See the available event types and their properties
          -- vim.notify(vim.inspect(event))
          -- Do something useful
          if event.type == "session.idle" then
            vim.notify("`opencode` finished responding")
          end
        end,
      })

      -- OpenCode mappings
      vim.o.autoread = true

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        opencode.toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        opencode.run("@this")
      end, { desc = "Ask opencode about current context" })

      vim.keymap.set("x", "go", function()
        opencode.add_visual_selection()
      end, { desc = "Add selection to opencode" })

      vim.keymap.set("n", "goo", function()
        opencode.add_visual_selection()
      end, { desc = "Add line to opencode" })

      vim.keymap.set("n", "<S-C-u>", function() opencode.prev_message() end, { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function() opencode.next_message() end, { desc = "Scroll opencode down" })

      -- Standard increment/decrement overrides
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  }
}
