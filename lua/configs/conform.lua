local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    css = { { "biomejs", "prettierd", "prettier" } },
    html = { { "biomejs", "prettierd", "prettier" } },
    javascript = { { "biomejs", "prettierd", "prettier" } },
    javascriptreact = { { "biomejs", "prettierd", "prettier" } },
    typescript = { { "biomejs", "prettierd", "prettier" } },
    typescriptreact = { { "biomejs", "prettierd", "prettier" } },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
