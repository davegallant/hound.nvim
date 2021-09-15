local curl = require "plenary.curl"
local config = require "hound.config"
local url_encoder = require "hound.url_encoder"

local api = vim.api

local M = {}

M.setup = config.setup

function M.reset()
  M.disable()
  require("plenary.reload").reload_module "hound"
  require("hound").enable()
end

local function display_results(results)
  if next(results) == nil then
    print "Nothing for you, Dawg."
    return
  end

  vim.cmd(config.options.split)

  local win = api.nvim_get_current_win()
  local buf = api.nvim_create_buf(false, true)
  local output = {}

  for repo_name, repo in pairs(results) do
    table.insert(output, "")
    table.insert(output, "Repo: " .. repo_name)
    table.insert(output, "================================================================================")
    for _, repo_match in pairs(repo["Matches"]) do
      for _, line_match in pairs(repo_match["Matches"]) do
        table.insert(output, "")
        table.insert(output, repo_match["Filename"] .. ":" .. line_match["LineNumber"])
        table.insert(output, "--------------------------------------------------------------------------------")
        for _, line in pairs(line_match["Before"]) do
          table.insert(output, line)
        end
        table.insert(output, line_match["Line"])
        for _, line in pairs(line_match["After"]) do
          table.insert(output, line)
        end
      end
    end
    table.insert(output, "")
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, output)
  api.nvim_win_set_buf(win, buf)
  api.nvim_buf_set_option(buf, "modifiable", false)
end

local function build_url(query)
  local encoded_query = url_encoder.encode(query)
  local url = config.options.hound_base_url
    .. ":"
    .. config.options.hound_port
    .. "/api/v1/search?stats=fosho&repos=*&rng=%3A20&q="
    .. encoded_query
    .. "&files=&excludeFiles=&i=nope&literal=nope"
  return url
end

local function fetch_results(query)
  local url = build_url(query)
  local res = curl.get(url, {
    accept = "application/json",
  })
  return vim.fn.json_decode(res.body).Results
end

function M.hound(query)
  local results = fetch_results(query)
  display_results(results)
end

return M
