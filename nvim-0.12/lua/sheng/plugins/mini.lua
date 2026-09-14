local status, mini_icons = pcall(require, "mini.icons")
if not status then return end

local M = {}
M.config = {
  style = "glyph",
}

mini_icons.setup(M.config)

-- Mock nvim-web-devicons so other plugins use mini.icons instead dev-icons
mini_icons.mock_nvim_web_devicons()
