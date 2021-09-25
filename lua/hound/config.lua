local M = {}

M.namespace = vim.api.nvim_create_namespace "Hound"

local defaults = {
  -- base url for the hound api
  hound_base_url = "http://localhost",
  -- the port hound is running on
  hound_port = 6080,
  -- how to open the search results (vsplit, split, tabnew). Defaults to nil (the same buffer).
  search_results_buffer = nil,
  -- whether or not urls should be displayed alongside file matches
  display_file_match_urls = false,
  -- format for display_file_match_urls
  hound_url_pattern = "https://github.com/{repo}/blob/{revision}/{path}#L{lineno}",
}

--- @type HoundOptions
M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
