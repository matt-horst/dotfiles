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

hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
