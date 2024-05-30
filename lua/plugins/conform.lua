return {
  {
    "stevearc/conform.nvim",
    optional = true,
    keys = {
      { "<leader>cn", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
    },
    opts = {
      formatters_by_ft = {
        fish = {},
        go = { "goimports", "gofmt" },
        python = { "isort", "ruff_fix", "ruff_format" },
        php = { "pint" },
        rust = { "rustfmt" },
        ["markdown"] = { { "prettier" } },
        ["markdown.mdx"] = { { "prettier" } },
        ["javascript"] = { { "biome", "deno_fmt", "prettier" } },
        ["javascriptreact"] = { "rustywind", { "biome", "deno_fmt", "prettier" } },
        ["typescript"] = { { "biome", "deno_fmt", "prettier" } },
        ["typescriptreact"] = { "rustywind", { "biome", "deno_fmt", "prettier" } },
        ["svelte"] = { "rustywind", { "biome", "deno_fmt", "prettier" } },
        ["html"] = { { "prettier" } },
        ["css"] = { { "prettier" } },
        ["scss"] = { { "prettier" } },
        ["less"] = { { "prettier" } },
        ["json"] = { { "prettier" } },
        ["yaml"] = { { "prettier" } },
        ["xml"] = { { "prettier" } },
        ["lua"] = { { "stylua" } },
        ["ruby"] = { { "rufo" } },
        ["java"] = { { "google_java_format" } },
        ["kotlin"] = { { "ktlint" } },
        ["c"] = { { "clang_format" } },
        ["cpp"] = { { "clang_format" } },
        ["cs"] = { { "csharpier" } },
        ["swift"] = { { "swiftformat" } },
        ["sh"] = { { "shfmt" } },
      },
      formatters = {
        biome = {
          condition = function(ctx)
            return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        deno_fmt = {
          condition = function(ctx)
            return vim.fs.find({ "deno.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        prettier = {
          condition = function(ctx)
            return not vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
              and not vim.fs.find({ "deno.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        stylua = {
          command = "stylua",
          args = { "--stdin-filepath", "$FILENAME", "-" },
          stdin = true,
        },
        rufo = {
          command = "rufo",
          args = { "$FILENAME" },
          stdin = true,
        },
        google_java_format = {
          command = "google-java-format",
          args = { "-" },
          stdin = true,
        },
        ktlint = {
          command = "ktlint",
          args = { "--stdin" },
          stdin = true,
        },
        clang_format = {
          command = "clang-format",
          args = { "--assume-filename", "$FILENAME" },
          stdin = true,
        },
        csharpier = {
          command = "dotnet-csharpier",
          args = { "$FILENAME" },
          stdin = true,
        },
        swiftformat = {
          command = "swiftformat",
          args = { "-" },
          stdin = true,
        },
        shfmt = {
          command = "shfmt",
          args = { "-" },
          stdin = true,
        },
      },
    },
  },
}
