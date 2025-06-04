


local function getHeader()

local default = 
[[                                    ██████                                    
                                    ████▒▒▒▒▒▒████                            
                                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                          
                                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        
                              ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                          
                              ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                      
                              ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                      
                            ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                    
                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                    
                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                    
                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                    
                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                    
                            ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                    
                            ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                    
                            ██      ██      ████      ████                        ]]

  local monster = [[
     ▄▄▄▄███▄▄▄▄    ▄██████▄  ███▄▄▄▄      ▄████████     ███        ▄████████    ▄████████ 
 ▄██▀▀▀███▀▀▀██▄ ███    ███ ███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███   ███    ███ 
 ███   ███   ███ ███    ███ ███   ███   ███    █▀     ▀███▀▀██   ███    █▀    ███    ███ 
 ███   ███   ███ ███    ███ ███   ███   ███            ███   ▀  ▄███▄▄▄      ▄███▄▄▄▄██▀ 
 ███   ███   ███ ███    ███ ███   ███ ▀███████████     ███     ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   
 ███   ███   ███ ███    ███ ███   ███          ███     ███       ███    █▄  ▀███████████ 
 ███   ███   ███ ███    ███ ███   ███    ▄█    ███     ███       ███    ███   ███    ███ 
  ▀█   ███   █▀   ▀██████▀   ▀█   █▀   ▄████████▀     ▄████▀     ██████████   ███    ███ 
                                                                              ███    ███
  ]]

  local pwd = vim.fn.getcwd()

  if string.find(string.lower(pwd), "monster") then
    return monster
  else
    return default
  end

end

return {
  terminal = {},
  zen = {},
  lazygit = {},
  statuscolumn = {
    enabled = true,
    folds = {
      open = true,    -- show open fold icons
      git_hl = false, -- use Git Signs hl for fold icons
    },
  },
  explorer = { replace_netrw = true, auto_close = true },
  dashboard = {
    sections = {
      { section = "header" },
      { section = "keys" },
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
      header = getHeader()
    }
  }
}
