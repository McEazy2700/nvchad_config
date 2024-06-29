return {
  {
    "kingavatar/nvchad-ui.nvim",
    branch = "v2.0",
    lazy = false,
    config = function()
      require("nvchad_ui").setup {
        lazyVim = true,
        statusline = { separator_style = "default", theme = "default", lualine = true },
        theme_toggle = { "tokyonight", "rose-pine" },
        nvdash = { load_on_startup = true },
      }

      vim.keymap.set("n", "<leader>lr", require("nvchad_ui.renamer").open, { desc = "nvchad Rename" })
    end,
  },
}
