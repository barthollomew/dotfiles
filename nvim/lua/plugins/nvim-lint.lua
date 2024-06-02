return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Linters for Markdown files
        markdown = { "markdownlint" },

        -- Linters for JavaScript/JSX/TypeScript/TSX files
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },

        -- Linters for Lua files
        lua = { "luacheck" },

        -- Linters for JSON/JSONC files
        json = { "jsonlint" },
        jsonc = { "jsonlint" },

        -- Linters for Go files
        go = { "golangcilint" },

        -- Linters for all file types
        ["*"] = { "cspell", "codespell" },
      },
    },
  },
}
