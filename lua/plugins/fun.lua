---@type LazySpec
return {
  -- cellular-automaton.nvim - 2k+ stars - code animations
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
      { "<leader>fmg", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life" },
    },
  },

  -- drop.nvim - screensaver
  {
    "folke/drop.nvim",
    event = "VimEnter",
    opts = {
      theme = "snow", -- or "stars", "xmas", "spring", "summer"
      max = 40,
      interval = 150,
      screensaver = 1000 * 60 * 5, -- 5 minutes
    },
  },
}
