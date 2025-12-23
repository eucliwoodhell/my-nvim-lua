local neotest = require("neotest")

neotest.setup({
  adapters = {
    -- Python
    require("neotest-python")({
      dap = { justMyCode = false }, -- si usas nvim-dap para debug
      runner = "pytest",            -- o "unittest" si prefieres
    }),

    -- Rust
    require("neotest-rust")({
      args = { "--nocapture" }, -- muestra output de tests en tiempo real
    }),

    -- TypeScript / JavaScript - Jest
    require("neotest-jest")({
      jestCommand = "npm test --",       -- o "yarn test --" / "pnpm test --"
      jestConfigFile = "jest.config.ts", -- o .js si es tu caso
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),

    -- TypeScript / JavaScript - Vitest
    require("neotest-vitest")({
      -- vitestCommand = "npx vitest", -- opcional si tu comando es especial
      filter_dir = function(name, rel_path, root)
        return name ~= "node_modules"
      end,
    }),
  },

  icons = {
    running = "",
    failed  = "",
    passed  = "",
    skipped = "",
  },
})
