return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	},
	--[[
	keys = {
		{"<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[S]earch [F]iles"},
		{"<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp"},
		{"<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[S]earch [K]eymaps"},
		{"<leader>ss", function() require("telescope.builtin")() end, desc = "[S]earch [S]elect Telescope"},
		{"<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch Current [W]ord", mode = {"n", "v"}},
		{"<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep"},
		{"<leader>sp", function() require("telescope.builtin").git_files() end, desc = "[S]earch by [P]roject"},
		{"<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics"},
		{"<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume"},
		{"<leader>s.", function() require("telescope.builtin").oldfiles() end, desc = "[S]earch Recent Files"},
		{"<leader>sc", function() require("telescope.builtin").commands() end, desc = "[S]earch [C]ommands"},
		{"<leader>s/", function()
			require("telescope.builtin").live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, desc = "[S]earch in Open Files"},
		{"<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Search Existing Buffers"},
	},
	extensions = {
		"ui-select",
	},
	]]
}
