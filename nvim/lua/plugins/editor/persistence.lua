return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  enabled = false,
  opts = {
    -- add any custom options here
  },
}
