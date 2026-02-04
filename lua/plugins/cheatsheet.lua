---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      -- Create function to show custom cheatsheet
      local function show_custom_cheatsheet()
        local lines = {
          "╭─────────────────────────────────────────────────────────╮",
          "│           🚀 DevOps & Productivity Toolkit             │",
          "╰─────────────────────────────────────────────────────────╯",
          "",
          "  Git & Version Control",
          "  ──────────────────────",
          "  <leader>gg    LazyGit           Full Git TUI",
          "  <leader>gd    Diff View         View file diffs",
          "  <leader>gh    File History      Git history for file",
          "  <leader>gb    Git Blame         Toggle inline blame",
          "  <leader>go    Octo (GitHub)     GitHub issues/PRs",
          "  <leader>gpl   PR List           List pull requests",
          "  <leader>gpc   PR Create         Create pull request",
          "",
          "  Containers & Kubernetes",
          "  ───────────────────────",
          "  <leader>lD    LazyDocker        Docker management TUI",
          "  <leader>lk    K9s               Kubernetes TUI",
          "  <leader>k     Kubectl           Native K8s interface",
          "",
          "  Databases & Monitoring",
          "  ──────────────────────",
          "  <leader>ls    LazySql           Database TUI",
          "  <leader>lb    Btop              System monitor",
          "  <leader>D     Database UI       DadBod database client",
          "",
          "  Email & Communication",
          "  ─────────────────────",
          "  <leader>lm    Neomutt           Terminal email client",
          "              F2 / ,g            → Switch to Gmail",
          "              F3 / ,t            → Switch to GT",
          "",
          "  Tasks & Notes",
          "  ─────────────",
          "  <leader>T     Task Panel        Toggle Neorg tasks",
          "  <leader>ni    Neorg Index       Open task index",
          "  <leader>nt    Today's Journal   Daily journal",
          "",
          "  Markdown & Docs",
          "  ───────────────",
          "  <leader>mp    Preview           Open markdown in browser",
          "  <leader>ms    Stop Preview      Close markdown preview",
          "              Supports:          README, mermaid, KaTeX",
          "",
          "  Navigation & Search",
          "  ───────────────────",
          "  s + 2 chars   Flash Jump        Jump anywhere (NEW!)",
          "  S             Flash Treesitter  Jump by code structure",
          "  <leader>o     Code Outline      Symbol outline",
          "  <leader>ff    Find Files        Telescope files",
          "  <leader>fw    Find Word         Grep in project",
          "  <leader>ft    Find Todos        Search TODO comments",
          "",
          "  Buffers & Windows",
          "  ─────────────────",
          "  <S-h>         Prev Buffer       Previous buffer",
          "  <S-l>         Next Buffer       Next buffer",
          "  <C-h/j/k/l>   Navigate          Move between windows",
          "",
          "  Harpoon (Quick Files)",
          "  ─────────────────────",
          "  <leader>ha    Add File          Add to harpoon",
          "  <leader>hh    Menu              Show harpoon menu",
          "  <leader>1-4   Jump              Jump to file 1-4",
          "",
          "  Debugging (NEW!)",
          "  ────────────────",
          "  <leader>db    Breakpoint        Toggle breakpoint",
          "  <leader>dc    Continue          Start/continue debug",
          "  <leader>di    Step Into         Step into function",
          "  <leader>do    Step Over         Step over line",
          "  <leader>dt    Terminate         Stop debugging",
          "  <leader>du    Debug UI          Toggle debug UI",
          "",
          "  Refactoring (NEW!)",
          "  ──────────────────",
          "  <leader>re    Extract Func      Extract to function",
          "  <leader>rv    Extract Var       Extract variable",
          "  <leader>ri    Inline Var        Inline variable",
          "",
          "  Code Tools",
          "  ──────────",
          "  <leader>cs    Code Snapshot     Screenshot selection",
          "  <leader>cS    Save Snapshot     Save to ~/Pictures",
          "",
          "  Diagnostics & Errors",
          "  ────────────────────",
          "  <leader>xx    Diagnostics       Show all diagnostics",
          "  <leader>xX    Buffer Diag       Current buffer only",
          "  <leader>xl    LSP References    Show references",
          "",
          "  Claude Code (AI Assistant)",
          "  ──────────────────────────",
          "  <leader>ac    Claude Code       Launch Claude terminal",
          "  <leader>af    Claude + File     Claude with file context",
          "  <leader>aF    Claude Float      Claude in floating window",
          "",
          "  Claude Commands (inside claude)",
          "  ───────────────────────────────",
          "  /commit       Git Commit        Create commit with AI",
          "  /review-pr    Review PR         Review pull request",
          "  /plan         Plan Mode         Plan implementation",
          "  /help         Help              Claude Code help",
          "  /clear        Clear             Clear conversation",
          "  /tasks        Task List         View task list",
          "  Ctrl-c Ctrl-c Cancel            Cancel operation",
          "",
          "  Visual Enhancements (NEW!)",
          "  ──────────────────────────",
          "  <leader>tc    Context           Toggle sticky headers",
          "  <leader>tw    Twilight          Dim inactive code",
          "  <leader>wp    Window Pick       Visual window select",
          "  <leader>fml   Make it Rain      Code rain animation",
          "",
          "  This Cheatsheet",
          "  ───────────────",
          "  <leader>?     Toggle            Show/hide this window",
          "",
          "  Press <Esc> or q to close this window",
          "",
        }

        -- Create buffer
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "filetype", "cheatsheet")

        -- Calculate window size
        local width = 61
        local height = #lines
        local row = math.floor((vim.o.lines - height) / 2)
        local col = math.floor((vim.o.columns - width) / 2)

        -- Create window
        local win_opts = {
          relative = "editor",
          width = width,
          height = height,
          row = row,
          col = col,
          style = "minimal",
          border = "rounded",
        }

        local win = vim.api.nvim_open_win(buf, true, win_opts)

        -- Set window options
        vim.api.nvim_win_set_option(win, "winblend", 0)
        vim.api.nvim_win_set_option(win, "cursorline", false)

        -- Set highlights
        vim.api.nvim_buf_add_highlight(buf, -1, "Title", 1, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 0, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 2, 0, -1)

        -- Highlight section headers
        for i, line in ipairs(lines) do
          if line:match("^  %w") and not line:match("^  <leader>") then
            vim.api.nvim_buf_add_highlight(buf, -1, "Function", i - 1, 0, -1)
          end
          if line:match("^  <leader>") or line:match("^  <S%-") or line:match("^  <C%-") or line:match("^  F%d") then
            vim.api.nvim_buf_add_highlight(buf, -1, "String", i - 1, 2, 16)
          end
        end

        -- Close on q or Esc
        vim.keymap.set("n", "q", function()
          vim.api.nvim_win_close(win, true)
        end, { buffer = buf, nowait = true })

        vim.keymap.set("n", "<Esc>", function()
          vim.api.nvim_win_close(win, true)
        end, { buffer = buf, nowait = true })
      end

      -- Create function for essential Neovim commands
      local function show_essential_commands()
        local lines = {
          "╭─────────────────────────────────────────────────────────╮",
          "│           ⚡ Essential Neovim Commands                 │",
          "╰─────────────────────────────────────────────────────────╯",
          "",
          "  Navigation (Motion)",
          "  ───────────────────",
          "  h j k l       Left/Down/Up/Right   Basic movement",
          "  w / b         Word forward/back     Jump by word",
          "  gg / G        Top/Bottom            Jump to start/end",
          "  0 / $         Line start/end        Beginning/end of line",
          "  { / }         Paragraph up/down     Jump paragraphs",
          "  Ctrl-u/d      Half page up/down     Scroll pages",
          "  % (on brace)  Match bracket         Jump to matching bracket",
          "",
          "  Window Navigation",
          "  ─────────────────",
          "  Ctrl-h/j/k/l  Move windows          Jump between splits",
          "  Ctrl-w s      Split horizontal      New horizontal split",
          "  Ctrl-w v      Split vertical        New vertical split",
          "  Ctrl-w q      Close window          Close current split",
          "  Ctrl-w o      Only                  Close all but current",
          "",
          "  File Explorer (Neo-tree)",
          "  ─────────────────────────",
          "  <leader>e     Toggle explorer       Show/hide file tree",
          "  a             Add file/folder       Create new",
          "  d             Delete                Delete file/folder",
          "  r             Rename                Rename file/folder",
          "  x             Cut                   Cut to clipboard",
          "  c             Copy                  Copy to clipboard",
          "  p             Paste                 Paste from clipboard",
          "",
          "  Code Folding",
          "  ────────────",
          "  za            Toggle fold           Open/close current fold",
          "  zA            Toggle recursive      Toggle all nested folds",
          "  zR            Open all folds        Expand everything",
          "  zM            Close all folds       Collapse everything",
          "  zc            Close fold            Close current fold",
          "  zo            Open fold             Open current fold",
          "",
          "  Editing",
          "  ───────",
          "  i / a         Insert/Append         Start insert mode",
          "  I / A         Line start/end        Insert at line edges",
          "  o / O         New line below/above  Create new line",
          "  x / X         Delete char           Delete forward/back",
          "  dd            Delete line           Cut entire line",
          "  yy            Yank line             Copy entire line",
          "  p / P         Paste after/before    Paste content",
          "  u / Ctrl-r    Undo/Redo             Undo and redo",
          "",
          "  Visual Mode",
          "  ───────────",
          "  v             Visual                Select characters",
          "  V             Visual Line           Select lines",
          "  Ctrl-v        Visual Block          Select block/column",
          "  gv            Reselect              Re-select last selection",
          "",
          "  Search & Replace",
          "  ────────────────",
          "  /pattern      Search forward        Find text forward",
          "  ?pattern      Search backward       Find text backward",
          "  n / N         Next/Previous         Jump to matches",
          "  *             Search word           Find word under cursor",
          "  :%s/old/new/g Global replace        Replace in file",
          "",
          "  Buffers & Tabs",
          "  ──────────────",
          "  <S-h>         Previous buffer       Go to prev buffer",
          "  <S-l>         Next buffer           Go to next buffer",
          "  <leader>bd    Delete buffer         Close current buffer",
          "  <leader>bb    Buffer list           Show all buffers",
          "",
          "  Terminal",
          "  ────────",
          "  <C-`>         Toggle terminal       Open/close terminal",
          "  <C-`> (in t)  Close terminal        Exit from terminal mode",
          "",
          "  LSP & Completion",
          "  ────────────────",
          "  gd            Go to definition      Jump to definition",
          "  gr            References            Show all references",
          "  K             Hover doc             Show documentation",
          "  <leader>la    Code actions          Show code actions",
          "  <leader>lr    Rename symbol         Rename across files",
          "",
          "  Saving & Quitting",
          "  ─────────────────",
          "  :w / <C-s>    Save                  Write file",
          "  :q            Quit                  Close window",
          "  :wq / ZZ      Save & quit           Write and close",
          "  :q! / ZQ      Quit no save          Close without saving",
          "",
          "  Help",
          "  ────",
          "  <leader>?     Custom tools          DevOps & productivity",
          "  <leader>??    This window           Essential Vim commands",
          "",
          "  Press <Esc> or q to close this window",
          "",
        }

        -- Create buffer
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "filetype", "cheatsheet")

        -- Calculate window size (slightly wider for this one)
        local width = 61
        local height = math.min(#lines, vim.o.lines - 4)
        local row = math.floor((vim.o.lines - height) / 2)
        local col = math.floor((vim.o.columns - width) / 2)

        -- Create window
        local win_opts = {
          relative = "editor",
          width = width,
          height = height,
          row = row,
          col = col,
          style = "minimal",
          border = "rounded",
        }

        local win = vim.api.nvim_open_win(buf, true, win_opts)

        -- Set window options
        vim.api.nvim_win_set_option(win, "winblend", 0)
        vim.api.nvim_win_set_option(win, "cursorline", false)

        -- Set highlights
        vim.api.nvim_buf_add_highlight(buf, -1, "Title", 1, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 0, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 2, 0, -1)

        -- Highlight section headers
        for i, line in ipairs(lines) do
          if line:match("^  [%w%s%(%)]+$") or line:match("^  [%w%s]+%s*$") then
            vim.api.nvim_buf_add_highlight(buf, -1, "Function", i - 1, 0, -1)
          end
          -- Highlight keybindings
          if line:match("^  [<>%w%-%s/]+%s+") then
            vim.api.nvim_buf_add_highlight(buf, -1, "String", i - 1, 2, 18)
          end
        end

        -- Close on q or Esc
        vim.keymap.set("n", "q", function()
          vim.api.nvim_win_close(win, true)
        end, { buffer = buf, nowait = true })

        vim.keymap.set("n", "<Esc>", function()
          vim.api.nvim_win_close(win, true)
        end, { buffer = buf, nowait = true })
      end

      -- Add keybinding to opts.mappings
      if not opts.mappings then opts.mappings = {} end
      if not opts.mappings.n then opts.mappings.n = {} end

      opts.mappings.n["<leader>?"] = {
        show_custom_cheatsheet,
        desc = "Show DevOps tools cheatsheet",
      }

      opts.mappings.n["<leader>??"] = {
        show_essential_commands,
        desc = "Show essential Neovim commands",
      }

      return opts
    end,
  },
}
