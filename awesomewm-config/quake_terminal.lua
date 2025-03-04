-- quake_terminal.lua
local awful = require("awful")
local beautiful = require("beautiful")

-- Create module table
local quake_terminal = {}

-- Terminal state variables
local terminal = nil
local terminal_shown = false

-- Function to toggle the terminal visibility
function quake_terminal.toggle(terminal_cmd, options)
    -- Set default options
    options = options or {}
    local width = options.width or 0.95
    local height = options.height or 0.4
    local placement = options.placement or awful.placement.top
    
    if terminal == nil then
        -- Create terminal on first use
        terminal = awful.spawn.spawn(terminal_cmd, {
            floating = true,
            placement = placement,
            width = screen[mouse.screen].workarea.width * width,
            height = screen[mouse.screen].workarea.height * height,
            skip_taskbar = true,
            ontop = true
        })
        terminal_shown = true
    else
        -- Toggle visibility
        if terminal_shown then
            client.get()[terminal]:minimized(true)
            terminal_shown = false
        else
            client.get()[terminal]:minimized(false)
            client.get()[terminal]:raise()
            terminal_shown = true
        end
    end
end

-- Setup function to bind keys
function quake_terminal.setup(args)
    args = args or {}
    args.modkey = args.modkey or { "Mod4", "Shift" }
    args.key = args.key or "Return"
    args.terminal_cmd = args.terminal_cmd or "xterm"
    args.options = args.options or {}
    
    -- Add keybinding
    globalkeys = awful.util.table.join(
        globalkeys,
        awful.key(args.modkey, args.key, function() 
            quake_terminal.toggle(args.terminal_cmd, args.options) 
        end,
        {description = "toggle quake terminal", group = "launcher"})
    )
    
    -- Apply the keys
    root.keys(globalkeys)
end

return quake_terminal
