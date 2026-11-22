return {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },

            server = {
                on_attach = function(client, bufnr)
                    local bufopts = { silent = true, buffer = bufnr }
                    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, bufopts)
                    vim.keymap.set("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, bufopts)
                    vim.keymap.set("n", "<leader>ee", function() vim.cmd.RustLsp("explainError") end, bufopts)
                end,
                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            },
        }
    end,
}
