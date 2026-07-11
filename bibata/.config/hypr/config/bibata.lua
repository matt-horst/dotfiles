local cursorSize = "24"
local cursorTheme = "Bibata-Modern-Ice"

hl.env("XCURSOR_SIZE", cursorSize)
hl.env("HYPRCURSOR_SIZE", cursorSize)
hl.env("XCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_THEME", cursorTheme)

hl.config({
    cursor = {
        no_hardware_cursors = 1,
    },
})
