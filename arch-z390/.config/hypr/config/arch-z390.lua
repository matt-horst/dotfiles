hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@144",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1080@60",
    position = "2560x0",
    scale    = "1",
})

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = (i <= 5) and "DP-2" or "HDMI-A-1",
        default = true,
        persistent = i == 1 or i == 6,
    })
end
