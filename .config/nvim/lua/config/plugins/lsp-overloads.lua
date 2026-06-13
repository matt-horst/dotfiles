require('lsp-overloads').setup({
    ui = {
        border = "single", -- border style: "none","single","double","rounded","solid","shadow"
        height = nil,  -- nil = auto-size
        width = nil,   -- nil = auto-size
        wrap = true,
        wrap_at = nil,
        max_width = nil,
        max_height = nil,
        close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
        focusable = true,
        focus = false,
        offset_x = 0,
        offset_y = 0,
        silent = true, -- suppress "No signature help" messages
        floating_window_above_cur_line = false,
        zindex = 50, -- z-index of the floating window
    },
    keymaps = {
        next_signature = '<C-j>',
        previous_signature = '<C-k>',
        next_parameter = '<C-l>',
        previous_parameter = '<C-h>',
        close_signature = '<A-s>',
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },
    display_automatically = true,
    override_native_handler = true,
    log_level = "warn",
})
