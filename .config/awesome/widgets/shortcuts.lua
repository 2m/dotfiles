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

        awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 5") end),
        awful.key({ }, "XF86MonBrightnessUp",   function () awful.util.spawn("xbacklight -inc 5") end),
        awful.key({ }, "XF86AudioRaiseVolume",  function () awful.util.spawn("amixer set Master 9%+") end),
        awful.key({ }, "XF86AudioLowerVolume",  function () awful.util.spawn("amixer set Master 9%-") end),
        awful.key({ }, "XF86AudioMute",         function () awful.util.spawn("amixer sset Master toggle") end)
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
