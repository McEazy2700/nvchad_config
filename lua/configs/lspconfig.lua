-- UTILITY FUNCTIONS --

--- @return table
--- @param t1 table The base table
--- @param t2 table The table to be merged to base
function MergeTables(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        MergeTables(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

-- CONFIGURATION --

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "tailwindcss", "eslint", "pyright" }

local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local lsp_configs = {
  tsserver = {
    commands = {
      OrganizeImports = {
        ts_organize_imports,
        description = "Organize Imports",
      },
    },
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local base_config = {
    on_attach = function(client)
      on_attach(client)
      local map = vim.keymap.set
      map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Lsp References" })
      map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Lsp Definitions" })
      map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Lsp Implementations" })
      map("n", "gx", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Lsp Diagnostics" })
      map("n", "lx", "<cmd>Telescope diagnostics<cr>", { desc = "Lsp Diagnostics" })
      map("n", "lr", function()
        require("nvchad_ui.renamer").open()
      end, { desc = "Lsp Rename" })
      map("n", "lf", function()
        vim.lsp.buf.format { async = true }
      end, { desc = "Lsp Format" })
      map("n", "la", vim.lsp.buf.code_action, { desc = "Lsp Code action" })
      map("n", "[d", function()
        vim.diagnostic.goto_prev()
        vim.diagnostic.open_float()
      end, { desc = "Prev lsp Diagnostics" })
      map("n", "]d", function()
        vim.diagnostic.goto_next()
        vim.diagnostic.open_float()
      end, { desc = "Next lsp Diagnostics" })
    end,
    on_init = on_init,
    capabilities = capabilities,
  }

  if lsp_configs[lsp] ~= nil then
    local merged = MergeTables(base_config, lsp_configs[lsp])
    lspconfig[lsp].setup(merged)
  else
    lspconfig[lsp].setup(base_config)
  end
end
