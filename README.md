# hound.nvim

A plugin that can query and display [hound](https://github.com/hound-search/hound) code search results with highlighting. This is a port of [jfo/hound.vim](https://github.com/jfo/hound.vim) in Lua.

## Install

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua
use {
  "davegallant/hound.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("hound").setup {
      -- your config or leave blank for defaults
    }
  end
}
```

## ⚙️ Configuration

```lua
{
  -- base url for the hound api
  hound_base_url = "http://localhost",
  -- the port hound is running on
  hound_port = 6080,
  -- how to open the search results (vsplit, split, tabnew). Defaults to nil (the same buffer).
  search_results_buffer = nil,
  -- whether or not urls should be displayed alongside file matches
  display_file_match_urls = false,
  -- format for display_file_match_urls
  file_match_url_pattern = "https://github.com/{repo}/blob/{revision}/{path}#L{lineno}",
}
```

## Usage

The `:Hound` command that takes a query (string) and displays the search results in a buffer.
