local M = {}

M.namespace = vim.api.nvim_create_namespace "Hound"

local defaults = {
  hound_base_url = "http://localhost", -- base url for the hound api
  hound_port = 6080, -- the port hound is running on
  split = "newtab", -- where to open the search results (vsplit, split, newtab)
}

--- @type HoundOptions
M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M
