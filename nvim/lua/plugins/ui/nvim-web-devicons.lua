-- Lualine hardcoded icons usage from nvim-web-devicons, so we need to disable it so lazy can fallback to use nvim-icons instead
return {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = false,
  },
}
