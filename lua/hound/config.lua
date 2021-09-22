local M = {}

M.namespace = vim.api.nvim_create_namespace "Hound"

local defaults = {
  hound_base_url = "http://localhost", -- base url for the hound api
  hound_port = 6080, -- the port hound is running on
  search_results_buffer = "tabnew", -- how to open the search results (vsplit, split, tabnew)
  display_file_match_urls = false, -- whether or not urls should be displayed alongside file matches
  hound_url_pattern = "https://github.com/{repo}/blob/{revision}/{path}", -- format for display_file_match_urls
}

--- @type HoundOptions
M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
