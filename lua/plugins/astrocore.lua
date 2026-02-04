---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    features = {
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        scrolloff = 8,
        cursorline = true,
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
        clipboard = "unnamedplus", -- Use system clipboard
      },
    },
    mappings = {
      n = {
        ["<C-s>"] = { "<cmd>w<cr>", desc = "Save" },
        ["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Prev buffer" },
        ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
        -- Git
        ["<leader>gg"] = { "<cmd>LazyGit<cr>", desc = "LazyGit" },
        ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
        ["<leader>gh"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
        -- Docker & Kubernetes
        ["<leader>lD"] = { "<cmd>LazyDocker<cr>", desc = "LazyDocker" },
        ["<leader>lk"] = { "<cmd>K9s<cr>", desc = "K9s" },
        -- Database
        ["<leader>ls"] = { "<cmd>LazySql<cr>", desc = "LazySql" },
        -- System Monitor
        ["<leader>lb"] = { "<cmd>Btop<cr>", desc = "Btop (toggle)" },
        -- Email
        ["<leader>lm"] = { "<cmd>terminal neomutt<cr>", desc = "Neomutt (email)" },
        -- Tasks
        ["<leader>T"] = { function()
          -- Toggle neorg task panel on left
          local wins = vim.api.nvim_list_wins()
          local task_win = nil
          for _, win in ipairs(wins) do
            if vim.api.nvim_win_is_valid(win) then
              local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
              if ok then
                local bufname = vim.api.nvim_buf_get_name(buf)
                if bufname:match("neorg/tasks") then
                  task_win = win
                  break
                end
              end
            end
          end

          if task_win and vim.api.nvim_win_is_valid(task_win) then
            pcall(vim.api.nvim_win_close, task_win, false)
          else
            vim.cmd("leftabove 50vsplit ~/neorg/tasks/index.norg")
            vim.cmd("wincmd H") -- Move window to far left
          end
        end, desc = "Toggle task panel" },
        -- Diagnostics
        ["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
        ["<leader>xX"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      },
      i = {
        ["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save" },
      },
      t = {
        ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      },
    },
  },
}
