return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local enabled_filetypes = {
				lua = true,
			}

			if enabled_filetypes[vim.bo[bufnr].filetype] then
				return { timeout_ms = 500 }
			end
			
			return nil
		end,
		default_format_opts = {
			-- Use external formatters if configured, otherwise use LSP formatting as a fallback
			lsp_format = "fallback"
		},
	},
}
