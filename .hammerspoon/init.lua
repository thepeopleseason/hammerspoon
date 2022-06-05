hs.window.animationDuration = 0

-- define screens
local laptopScreen = "Built-in Retina Display"
local vScreen = "S23C570"
local dellScreen = "DELL U3419W"
local miamiScreen = "HP S2031"

local function primaryScreen()
  if hs.screen(miamiScreen) then
    return hs.screen(miamiScreen)
  elseif hs.screen(dellScreen) then
    return hs.screen(dellScreen)
  else
    return nil
  end
end

-- general geometry definitions
geos = {
  fs = hs.geometry.unitrect(0.0, 0.0, 1.0, 1.0),
  llarge = hs.geometry.unitrect(0.0, 0.0, 0.66, 1.0),
  lhalf = hs.geometry.unitrect(0.0, 0.0, 0.5, 1.0),
  rlarge = hs.geometry.unitrect(0.33, 0.0, 0.66, 1.0),
  rhalf = hs.geometry.unitrect(0.5, 0.0, 0.5, 1.0),

  tlarge = hs.geometry.unitrect(0.0, 0.0, 1.0, 0.66),
  thalf = hs.geometry.unitrect(0.0, 0.0, 1.0, 0.5),
  blarge = hs.geometry.unitrect(0.0, 0.34, 1.0, 0.67),
  bhalf = hs.geometry.unitrect(0.0, 0.5, 1.0, 0.5),

  ltq = hs.geometry.unitrect(0.0, 0.0, 0.5, 0.5),
  lbq = hs.geometry.unitrect(0.0, 0.5, 0.5, 0.5),
  rtq = hs.geometry.unitrect(0.5, 0.0, 0.5, 0.5),
  rbq = hs.geometry.unitrect(0.5, 0.5, 0.5, 0.5),

  lthird = hs.geometry.unitrect(0.0, 0.0, 0.33, 1.0),
  mthird = hs.geometry.unitrect(0.33, 0.0, 0.33, 1.0),
  rthird = hs.geometry.unitrect(0.66, 0.0, 0.33, 1.0),

  ltthird = hs.geometry.unitrect(0.0, 0.0, 0.33, 0.5),
  mtthird = hs.geometry.unitrect(0.33, 0.0, 0.33, 0.5),
  rtthird = hs.geometry.unitrect(0.66, 0.0, 0.33, 0.5),

  lbthird = hs.geometry.unitrect(0.0, 0.5, 0.33, 0.5),
  mbthird = hs.geometry.unitrect(0.33, 0.5, 0.33, 0.5),
  rbthird = hs.geometry.unitrect(0.66, 0.5, 0.33, 0.5),

  tthird = hs.geometry.unitrect(0.0, 0.0, 1.0, 0.33),
  cthird = hs.geometry.unitrect(0.0, 0.33, 1.0, 0.33),
  bthird = hs.geometry.unitrect(0.0, 0.66, 1.0, 0.33),

  term = hs.geometry.unitrect(0.0, 0.0, 0.29, 0.99),
  termr = hs.geometry.unitrect(0.7, 0.0, 0.29, 0.99),
}

-- layouts for use with hs.layout.apply() and layout_app()
layouts = {
  -- hs.layout.apply() layouts
  laptop = {
    {"Slack", nil, laptopScreen, geos["fs"], nil, nil},
    {"Google Chrome", nil, laptopScreen, geos["fs"], nil, nil},
    {"Terminal", nil, laptopScreen, geos["term"], nil, nil},
  },
  zoombrowse = {
    {"zoom.us", nil, primaryScreen(), geos["lthird"], nil, nil},
  },
  home3 = {
    {"Slack", nil, vScreen, geos["blarge"], nil, nil},
    {"zoom.us", nil, primaryScreen(), geos["lthird"], nil, nil},
    {"Google Chrome",
     hs.window.find("MCCal .* James %(James MC %(Profile 1%)%)"),
     vScreen, geos["tthird"], nil, nil},
    {"Google Chrome", hs.window.find("Voice %- Google Chrome %- James %(Default%)"),
     laptopScreen, geos["fs"], nil, nil},
  },
  v2 = {
    {"Slack", nil, laptopScreen, geos["bhalf"], nil, nil},
    {"Google Chrome", nil, vScreen, geos["blarge"], nil, nil},
    {"Terminal", nil, vScreen, geos["tthird"], nil, nil},
  },
  pcm2 = {
    {"Slack", nil, laptopScreen, geos["lhalf"], nil, nil},
    {"Google Chrome", nil, primaryScreen(), geos["llarge"], nil, nil},
    {"Terminal", nil, primaryScreen(), geos["rthird"], nil, nil},
  },
  code2 = {
    {"Slack", nil, laptopScreen, geos["bhalf"], nil, nil},
    {"Google Chrome", nil, primaryScreen(), geos["rlarge"], nil, nil},
    {"Terminal", nil, primaryScreen(), geos["lthird"], nil, nil},
  },
  filemgmt = {
    {"Google Chrome", nil, primaryScreen(), geos["rhalf"], nil, nil},
    {"Terminal", nil, primaryScreen(), geos["rhalf"], nil, nil},
  },

  -- layout_app() layouts
  home3_chrome = {
    {geos["lhalf"], primaryScreen()},
    {geos["rhalf"], primaryScreen()},
  },
  home3_term = {
    {geos["term"], primaryScreen()},
    {geos["termr"], primaryScreen()},
  },
  filemgmt_finder = {
    {geos["ltq"], primaryScreen()},
    {geos["lbq"], primaryScreen()},
  },
  chrome2 = {
    {geos["lhalf"], primaryScreen()},
    {geos["rhalf"], primaryScreen()},
  },
  chrome3 = {
    {geos["lthird"], primaryScreen()},
    {geos["mthird"], primaryScreen()},
    {geos["rthird"], primaryScreen()},
  },
  chrome4 = {
    {geos["ltq"], primaryScreen()},
    {geos["rtq"], primaryScreen()},
    {geos["lbq"], primaryScreen()},
    {geos["rbq"], primaryScreen()},
  },
  chrome6 = {
    {geos["ltthird"], primaryScreen()},
    {geos["mtthird"], primaryScreen()},
    {geos["rtthird"], primaryScreen()},
    {geos["lbthird"], primaryScreen()},
    {geos["mbthird"], primaryScreen()},
    {geos["rbthird"], primaryScreen()},
  },
  zoom_chrome = {
    {geos["mthird"], primaryScreen()},
    {geos["rthird"], primaryScreen()},
  },
}

-- chain sequences (see chain() function below)
left = { geos["lhalf"], geos["llarge"], geos["lthird"] }
right = { geos["rhalf"], geos["rlarge"], geos["rthird"] }
up = { geos["thalf"], geos["tlarge"], geos["tthird"] }
down = { geos["bhalf"], geos["blarge"], geos["bthird"] }

full_grid = { geos["ltq"], geos["rtq"], geos["lbq"], geos["rbq"],
              geos["lthird"], geos["mthird"], geos["rthird"],
              geos["tthird"], geos["cthird"], geos["bthird"],
              geos["ltthird"], geos["mtthird"], geos["rtthird"],
              geos["lbthird"], geos["mbthird"], geos["rbthird"] }

term = { geos["term"], geos["termr"] }

local function round(x, places)
  local places = places or 0
  local x = x * 10^places
  return (x + 0.5 - (x + 0.5) % 1) / 10^places
end

local function current_window_rect(win)
  local win = win or hs.window.focusedWindow()
  local ur, r = win:screen():toUnitRect(win:frame()), round
  return {r(ur.x,2), r(ur.y,2), r(ur.w,2), r(ur.h,2)} -- an hs.geometry.unitrect table
end

table.indexOf = function (t, obj)
  if type(t) ~= "table" then error("table expected, got " .. type(t), 2) end

  for i, v in pairs(t) do
    if obj == v then
      return i
    end
  end
end

local function next_position(t, urect)
  local next_index = 1
  local cur_index = table.indexOf(t, hs.geometry.unitrect(urect))
  if cur_index then
    next_index = cur_index + 1
    if next_index > #t then
      next_index = 1
    end
  end
  return t[next_index]
end

local function chain(t, win)
  local win = win or hs.window.focusedWindow()
  win:move(next_position(t, current_window_rect(win)))
end

local function layout_app(wins, layout)
  for i, win in ipairs(wins) do
    local layout_index = i
    if layout_index > #layout then layout_index = #layout end
    win:moveToScreen(layout[layout_index][2])
    win:move(layout[layout_index][1])
  end
end

local function adjust(dim, amt)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f[dim] = f[dim] + amt
  win:setFrame(f)
end

local function gridify(app_table)
  if     #app_table == 2 then layout_app(app_table, layouts["chrome2"])
  elseif #app_table == 3 then layout_app(app_table, layouts["chrome3"])
  elseif #app_table == 4 then layout_app(app_table, layouts["chrome4"])
  elseif #app_table >= 5 then layout_app(app_table, layouts["chrome6"])
  end
end

local function switch_audio(aud)
  if aud:setDefaultOutputDevice() then
    hs.alert.show("🔈" .. aud:name())
  end
end


-- resize bindings
hs.hotkey.bind({"ctrl", "alt"}, "left", function () adjust("w", -20) end)
hs.hotkey.bind({"ctrl", "alt"}, "right", function () adjust("w", 20) end)
hs.hotkey.bind({"ctrl", "alt"}, "up", function () adjust("h", -20) end)
hs.hotkey.bind({"ctrl", "alt"}, "down", function () adjust("h", 20) end)

-- nudge bindings
hs.hotkey.bind({"ctrl", "alt", "shift"}, "left", function () adjust("x", -50) end)
hs.hotkey.bind({"ctrl", "alt", "shift"}, "right", function () adjust("x", 50) end)
hs.hotkey.bind({"ctrl", "alt", "shift"}, "up", function () adjust("y", -50) end)
hs.hotkey.bind({"ctrl", "alt", "shift"}, "down", function () adjust("y", 50) end)

-- throw bindings
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  hs.window.focusedWindow():moveOneScreenWest(true, true)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  hs.window.focusedWindow():moveOneScreenEast(true, true)
end)

-- chain bindings
hs.hotkey.bind({"cmd", "alt"}, "Left", function() chain(left) end)
hs.hotkey.bind({"cmd", "alt"}, "Right", function() chain(right) end)
hs.hotkey.bind({"cmd", "alt"}, "Up", function () chain(up) end)
hs.hotkey.bind({"cmd", "alt"}, "Down", function() chain(down) end)
hs.hotkey.bind({"ctrl", "shift"}, "Right", function() chain(full_grid) end)
hs.hotkey.bind({"cmd", "alt"}, "t", function() chain(term) end)

-- layout bindings
hs.hotkey.bind({"cmd", "alt"}, "f", function() hs.window.focusedWindow():maximize() end)
hs.hotkey.bind({"cmd", "alt"}, "q", function()
  wf = hs.window.filter.new()
  wins = wf:setCurrentSpace(true):setScreens(dellScreen):rejectApp("zoom.us"):getWindows()
  if     #wins == 1 then layout_app(wins, {{geos["rlarge"], primaryScreen()}})
  elseif #wins  > 1 then layout_app(wins, layouts["zoom_chrome"])
  end
  hs.layout.apply(layouts["zoombrowse"])
end)
hs.hotkey.bind({"cmd", "alt"}, "v", function() hs.layout.apply(layouts["v2"]) end)
hs.hotkey.bind({"cmd", "alt"}, "m", function()
  hs.layout.apply(layouts["filemgmt"])
  layout_app(hs.application.get("Finder"):allWindows(), layouts["filemgmt_finder"])
end)
hs.hotkey.bind({"cmd", "alt"}, "1", function() hs.layout.apply(layouts["laptop"]) end)
hs.hotkey.bind({"cmd", "alt"}, "2", function() hs.layout.apply(layouts["pcm2"]) end)
hs.hotkey.bind({"cmd", "alt"}, "3", function()
  hs.layout.apply(layouts["home3"])
  layout_app(hs.window.filter.new("Terminal"):setCurrentSpace(true):setScreens(dellScreen):getWindows(),
             layouts["home3_term"])
  layout_app(hs.window.filter.new("Google Chrome"):setCurrentSpace(true):setScreens(dellScreen):getWindows(),
             layouts["home3_chrome"])
end)
hs.hotkey.bind({"cmd", "alt"}, "h", function()
  layout_app(hs.window.filter.new("Google Chrome"):setCurrentSpace(true):setScreens(dellScreen):getWindows(),
             layouts["chrome2"])
end)
hs.hotkey.bind({"cmd", "alt"}, "4", function()
  layout_app(hs.window.filter.new("Google Chrome"):setCurrentSpace(true):setScreens(dellScreen):getWindows(),
             layouts["chrome4"])
end)
hs.hotkey.bind({"cmd", "alt"}, "9", function()
  gridify(hs.window.filter.new():setScreens(dellScreen):getWindows())
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "9", function()
  gridify(hs.window.focusedWindow():application():allWindows())
end)

-- utility bindings
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "d", function()
  hs.eventtap.keyStrokes(os.date('%Y-%m-%d'))
end)
hs.hotkey.bind({"cmd", "alt"}, "0", function() hs.reload() end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "h", function()
  switch_audio(hs.audiodevice.findDeviceByName("External Headphones"))
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  switch_audio(hs.audiodevice.findDeviceByName("MacBook Pro Speakers"))
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "m", function()
  switch_audio(hs.audiodevice.findDeviceByName("DELL U3419W"))
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "i", function()
  hs.execute("/usr/local/bin/m1ddc display `/usr/local/bin/m1ddc display list | grep DELL | cut -c 1` set input 17")
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "p", function()
  hs.application.launchOrFocusByBundleID("com.pingidentity.pingid.pcclient")
end)

hs.ipc.cliStatus() -- load IPC for commandline util
hs.alert.show("Config loaded")

