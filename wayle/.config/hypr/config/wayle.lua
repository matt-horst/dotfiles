hl.on("hyprland.start", function() hl.exec_cmd("wayle panel start") end)

hl.bind(MOD .. " + B", hl.dsp.exec_cmd("wayle panel toggle"))
hl.bind(MOD .. " + SHIFT + B", hl.dsp.exec_cmd("wayle panel settings"))
