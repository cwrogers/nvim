return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {},
      zen = {},
      lazygit = {},
      dashboard = {

        sections = {
          {
            section = "terminal",
            cmd = string.format(
              "chafa '%s' --format symbols --symbols vhalf --size 60x17 --stretch; sleep .5",
              os.getenv("WALLPAPER_PATH")
            ),
            height = 17,
            width = 64,
            padding = 0,
          },
          { pane = 1, hl="header", title = os.getenv("WALLPAPER_LOC"), height=13},
          { pane = 2, section = "terminal", cmd="fortune -s | cowsay -f duck"},
          { pane = 2, section = "keys"},
          --{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        },
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        }
      }
    }
  }
}
