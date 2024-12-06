return {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },
    },
    WARN = {
      alt = { "WARNING", "WARN" },
    },
    PERF = {
      alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
    }
  },
  highlight = {
    before = "",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*]],
    comments_only = true,
    max_line_len = 400,
    exclude = {}
  },
  key = {
    { "<leader>tt", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>tf", function() require("todo-comments").filter() end, desc = "Filter todo comments" },
  }
}
