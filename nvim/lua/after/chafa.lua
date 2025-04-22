return function()
  require("chafa").setup({
    opts = {
      render = {
        min_padding = 5,
        show_label = true,
      },
      events = {
        update_on_nvim_resize = true,
      },
    },
  })
end
