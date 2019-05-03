local gears = require("gears")
local awful = require("awful")
local shortcuts = {}

shortcuts.add_to_global_keys = function(global_keys)
    return gears.table.join(
        global_keys,
        awful.key({ modkey,           }, "F1",     function () awful.screen.focus(3) end),
        awful.key({ modkey,           }, "F2",     function () awful.screen.focus(1) end),
        awful.key({ modkey,           }, "F3",     function () awful.screen.focus(2) end),

        awful.key({ modkey,           }, "Left",   function () tagSwitchHorizontal(-1, false)  end),
        awful.key({ modkey,           }, "Right",  function () tagSwitchHorizontal(1, false)   end),
        awful.key({ modkey,           }, "Up",     function () tagSwitchVertical(3, false)     end),
        awful.key({ modkey,           }, "Down",   function () tagSwitchVertical(-3, false)    end),

        awful.key({ }, "XF86MonBrightnessDown", function () awful.spawn.easy_async({"light", "-U", "5%"}, function() end) end),
        awful.key({ }, "XF86MonBrightnessUp",   function () awful.spawn.easy_async({"light", "-A", "5%"}, function() end) end),
        awful.key({ }, "XF86AudioRaiseVolume",  function () awful.spawn.easy_async({"amixer", "set", "Master", "9%+"}, function() end) end),
        awful.key({ }, "XF86AudioLowerVolume",  function () awful.spawn.easy_async({"amixer", "set", "Master", "9%-"}, function() end) end),
        awful.key({ }, "XF86AudioMute",         function () awful.spawn.easy_async({"amixer", "sset", "Master", "toggle"}, function() end) end),

        awful.key({ modkey }, "r",         function () awful.spawn.easy_async({"rofi", "-dpi", "196", "-modi", "combi", "-theme", "solarized", "-font", "fira code 10", "-show", "combi"}, function() end) end)
    )
end

shortcuts.add_to_client_keys = function(client_keys)
    return gears.table.join(
        client_keys,
        awful.key({ modkey, "Shift"     }, "Left",  function (c) tagSwitchHorizontal(-1, true)       end),
        awful.key({ modkey, "Shift"     }, "Right", function (c) tagSwitchHorizontal(1, true)        end),
        awful.key({ modkey, "Shift"     }, "Up",    function (c) tagSwitchVertical(3, true)          end),
        awful.key({ modkey, "Shift"     }, "Down",  function (c) tagSwitchVertical(-3, true)         end),
        awful.key({ modkey,             }, "w",     function (c) c:kill()                            end)
    )
end

tagSwitch = function(newidx, moveClient)
    local tags = awful.screen.focused().tags
    local newtag = tags[newidx]
    if moveClient then
        awful.client.movetotag(newtag)
    end
    awful.tag.viewonly(newtag)
    awful.spawn.easy_async({"notify-send", "-u", "normal", "-t", "300", "--", newtag.name}, function() end)
end

tagSwitchHorizontal = function(offset, moveClient)
    local dim = 3
    local curidx = awful.tag.getidx()
    local cur = math.floor((curidx - 1) / dim)
    local newidx = ((curidx - 1 + offset) + dim) % dim + 1 + (3 * cur)
    tagSwitch(newidx, moveClient)
end

tagSwitchVertical = function(offset, moveClient)
    local dim = 9
    local curidx = awful.tag.getidx()
    local newidx = ((curidx - 1 + offset) + dim) % dim + 1
    tagSwitch(newidx, moveClient)
end

return shortcuts
