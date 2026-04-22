return {
  {
    "nickjvandyke/opencode.nvim",
    lazy = false,
    version = "*",
    dependencies = {},
    config = function()
      local opencode = require("opencode")

      opencode.setup({
        -- Your options here
      })
      -- OpenCode mappings
      local api = require("opencode.api") -- Use the API submodule for keymaps
      vim.o.autoread = true

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        api.toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        api.run("@this")
      end, { desc = "Ask opencode about current context" })

      vim.keymap.set("x", "go", function()
        api.add_visual_selection()
      end, { desc = "Add selection to opencode" })

      vim.keymap.set("n", "goo", function()
        api.add_visual_selection()
      end, { desc = "Add line to opencode" })

      vim.keymap.set("n", "<S-C-u>", function() api.prev_message() end, { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function() api.next_message() end, { desc = "Scroll opencode down" })

      -- Standard increment/decrement overrides
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  }
}
