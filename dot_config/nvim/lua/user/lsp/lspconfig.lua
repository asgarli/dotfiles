-- It's important that you set up the plugins in the following order:
--    mason.nvim
--    mason-lspconfig.nvim
--    Setup servers via lspconfig

-- Pay extra attention to this if you lazy-load plugins, or somehow "chain" the loading of plugins via your plugin manager.

-- require("mason").setup()
-- require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local servers = {
  "bashls",
  "cssls",
  "html",
  "jsonls",
  "lua_ls",
  "pyright",
  "remark_ls",
  "rust_analyzer",
  "tsserver",
  "yamlls",
}

mason.setup()

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end


mason_lspconfig.setup({
  ensure_installed = servers
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
lspconfig.pyright.setup({})
lspconfig.remark_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})

local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
  return
end

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require("trouble").setup {}
