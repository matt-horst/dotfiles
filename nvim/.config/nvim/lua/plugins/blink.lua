return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets", -- optional: provides snippets for the snippet source
    },

    version = "1.*", -- use stable version

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-x>"] = { "hide", "fallback" },
            ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
            ["<C-u>"] = { "scroll_documentation_up", "scroll_signature_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "scroll_signature_down", "fallback" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500,
                window = {
                    border = "rounded",
                },
            },

            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },

            ghost_text = {
                enabled = true,
            },

            menu = {
                border = "rounded",
            },
        },


        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },

        signature = {
            enabled = true,
            window = {
                border = "rounded",
                show_documentation = true,
            },
        },
    },
}
