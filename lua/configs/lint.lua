require("lint").linters_by_ft = {
  markdown = { "vale" },
  python = { "ruff" },
  javascript = { "biomejs", "eslint" },
  typescript = { "biomejs", "eslint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
