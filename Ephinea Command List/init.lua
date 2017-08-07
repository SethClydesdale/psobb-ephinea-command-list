-- imports
local core_mainmenu = require("core_mainmenu")

-- window vars
local window_open = false
local button_func = function()
  window_open = not window_open
end

-- command list
local commands = {
       ["lang"] = "Sets quest language. (1=English, 2=Japanese, 3=Custom)",
    ["setname"] = "Change your party's name.",
    ["setpass"] = "Change your party's password.",
  ["partyinfo"] = "Displays information about the current party.",
        ["hbr"] = "Displays completion data for Hunters Boost road.",
       ["luck"] = "Displays your current luck level.",
   ["forecast"] = "Displays today's luck forecast.",
     ["noluck"] = "Denies luck boosts in games lead by you.",
     ["purist"] = "Toggle milestone rewards in games led by you.",
       ["bank"] = "Toggles between character and shared bank.",
      ["cbank"] = "Changes characters displayed at login.",
      ["lobby"] = "Quickly returns you to the lobby. (6 min. cooldown)",
    ["showwep"] = "Toggles SPECIAL WEAPON pickup names.",
   ["matcount"] = "Displays current character material usage.",
   ["matreset"] = "Reset character material usage.",
  ["killcount"] = "Displays kill counters for unsealable items.",
    ["modname"] = "Change your character's name. (< Lv 20)",
   ["modsecid"] = "Change your character's section ID. (< Lv 20)",
       ["ping"] = "Check your ping to the ship.",
       ["time"] = "Displays the current time."
}

-- keys used for setting the order of the commands
local command_keys = {
  "lang",
  "setname",
  "setpass",
  "partyinfo",
  "hbr",
  "luck",
  "forecast",
  "noluck",
  "purist",
  "bank",
  "cbank",
  "lobby",
  "showwep",
  "matcount",
  "matreset",
  "killcount",
  "modname",
  "modsecid",
  "ping",
  "time"
}

-- pad the right side of a string until it meets the specified length
local function PadRight(str, len)
  while string.len(str) < len do
    str = str .. " "
  end
  
  return str
end

-- draw the commands on screen
local drawCommands = function()
  imgui.PushTextWrapPos(imgui.GetWindowSize() - 30)
  
  for i = 1, #command_keys do
    imgui.TextColored(1, 1, 0, 1, PadRight("/" .. command_keys[i], 11))
    imgui.SameLine(0, 0)
    imgui.TextColored(0.7, 0.7, 0.7, 1, ": ")
    imgui.SameLine(0, 0)
    imgui.Text(commands[command_keys[i]])
    imgui.Spacing()
  end
  
  imgui.PopTextWrapPos()
end

-- show command list when opened
local function present()
  if window_open then
    local status
    imgui.SetNextWindowSize(600, 400, "FirstUseEver");
    status, window_open = imgui.Begin("Ephinea Command List", window_open)
    drawCommands()
    imgui.End()
  end
end

-- initial setup of the addon
local function init()
  core_mainmenu.add_button("Ephinea Command List", button_func)
  
  return {
    name = "Ephinea Command List",
    version = "1.0.0",
    author = "Seth Clydesdale",
    description = "Command list reference for Ephinea.",
    present = present
  }
end

return {
  __addon = {
    init = init
  }
}
