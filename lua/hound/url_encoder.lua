-- Adapted from: https://gist.github.com/liukun/f9ce7d6d14fa45fe9b924a3eed5c3d99
--

local M = {}

local char_to_hex = function(c)
  return string.format("%%%02X", string.byte(c))
end

function M.encode(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w _ %- . ~])", char_to_hex)
  url = url:gsub("([^%w _%%%-%.~])", char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

return M
