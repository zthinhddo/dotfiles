require("nvim-treesitter").install({
  "json", "javascript", "typescript", "tsx", "go", "yaml", "html", "css", "python", "http", "markdown", "markdown_inline", "graphql", "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c"
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function()
    pcall(vim.treesitter.start)
    -- Enable treesitter-based indentation (overuled smartindent, cident)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

