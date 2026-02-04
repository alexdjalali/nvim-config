---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "basedpyright",
        "ruff",
        "gopls",
        "gofumpt",
        "typescript-language-server",
        "prettier",
        "terraform-ls",
        "yaml-language-server",
        "dockerfile-language-server",
        "bash-language-server",
      },
    },
  },
}
