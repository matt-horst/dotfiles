hl.bind(MOD .. " + C", hl.dsp.window.close())
hl.bind(MOD .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(MOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MOD .. " + S", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(MOD .. " + I", hl.dsp.exec_cmd("hyprlock"))
hl.bind(MOD .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(MOD .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(MOD .. " + Y", hl.dsp.exec_cmd("hyprpicker -a"))

-- Move focus with MOD + arrow keys
hl.bind(MOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus with MOD + hjkl keys
hl.bind(MOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows with MOD + arrow keys
hl.bind(MOD .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(MOD .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(MOD .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(MOD .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Move windows with MOD + hjkl keys
hl.bind(MOD .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(MOD .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(MOD .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(MOD .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

local resizeDelta = 100

-- Resize active window with MOD + alt + hjkl keys
hl.bind(MOD .. " + ALT + H", hl.dsp.window.resize({ x = -resizeDelta, y = 0, relative = true }))
hl.bind(MOD .. " + ALT + L", hl.dsp.window.resize({ x = resizeDelta, y = 0, relative = true }))
hl.bind(MOD .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -resizeDelta, relative = true }))
hl.bind(MOD .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = resizeDelta, relative = true }))

-- # Resize active window with MOD + alt + arrow keys
hl.bind(MOD .. " + ALT + left", hl.dsp.window.resize({ x = -resizeDelta, y = 0, relative = true }))
hl.bind(MOD .. " + ALT + right", hl.dsp.window.resize({ x = resizeDelta, y = 0, relative = true }))
hl.bind(MOD .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -resizeDelta, relative = true }))
hl.bind(MOD .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = resizeDelta, relative = true }))

-- Switch workspaces with MOD + [0-9]
-- Move active window to a workspace with MOD + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(MOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(MOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with MOD + scroll
hl.bind(MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with MOD + LMB/RMB and dragging
hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
