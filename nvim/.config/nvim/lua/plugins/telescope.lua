return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files() <cr>",  desc = "[S]earch [F]iles" },
        { "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags() <cr>",   desc = "[S]earch [H]elp" },
        { "<leader>sk", "<cmd>lua require('telescope.builtin').keymaps() <cr>",     desc = "[S]earch [K]eymaps" },
        { "<leader>ss", "<cmd>lua require('telescope.builtin')() <cr>",             desc = "[S]earch [S]elect Telescope" },
        { "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string() <cr>", desc = "[S]earch Current [W]ord",    mode = { "n", "v" } },
        { "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep() <cr>",   desc = "[S]earch by [G]rep" },
        { "<leader>sp", "<cmd>lua require('telescope.builtin').git_files() <cr>",   desc = "[S]earch by [P]roject" },
        { "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics() <cr>", desc = "[S]earch [D]iagnostics" },
        { "<leader>sr", "<cmd>lua require('telescope.builtin').resume() <cr>",      desc = "[S]earch [R]esume" },
        { "<leader>s.", "<cmd>lua require('telescope.builtin').oldfiles() <cr>",    desc = "[S]earch Recent Files" },
        { "<leader>sc", "<cmd>lua require('telescope.builtin').commands() <cr>",    desc = "[S]earch [C]ommands" },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end,
            desc = "[S]earch in Open Files"
        },
        { "<leader><leader>", "<cmd>lua require('telescope.builtin').buffers() <cr>", desc = "Search Existing Buffers" },
    },
    --[[
	extensions = {
		"ui-select",
	},
	]]
}
