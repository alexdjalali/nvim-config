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
          "  Refactoring",
          "  ───────────",
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
          "  Visual Enhancements",
          "  ───────────────────",
          "  <leader>tc    Context           Toggle sticky headers",
          "  <leader>tw    Twilight          Dim inactive code",
          "  <leader>ut    Transparency      Toggle transparent bg",
          "  <leader>wp    Window Pick       Visual window select",
          "",
          "  Fun & Games 🎮",
          "  ──────────────",
          "  <leader>fml   Make it Rain      Code rain animation",
          "  <leader>fmg   Game of Life      Conway's Game of Life",
          "  <leader>fv    Vim Be Good       Practice vim motions",
          "  <leader>fl    LeetCode          Solve coding problems",
          "",
          "  Virtual Pets 🦆",
          "  ───────────────",
          "  <leader>dd    Hatch Duck        🦆 Spawn a duck",
          "  <leader>dc    Hatch Cat         🐱 Spawn a cat",
          "  <leader>dg    Hatch Dog         🐶 Spawn a dog",
          "  <leader>dr    Hatch Crab        🦀 Spawn a crab",
          "  <leader>ds    Hatch Snake       🐍 Spawn a snake",
          "  <leader>dk    Cook One          Remove one pet",
          "  <leader>da    Cook All          Remove all pets",
          "",
          "  Help Cheatsheets",
          "  ────────────────",
          "  <leader>?     DevOps            This window (tools)",
          "  <leader>??    Vim essentials    Basic Neovim commands",
          "  <leader>?l    Languages         Go & Python shortcuts",
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
          "  Help Cheatsheets",
          "  ────────────────",
          "  <leader>?     DevOps tools          Productivity & tools",
          "  <leader>??    Vim essentials        This window (you are here)",
          "  <leader>?l    Languages             Go & Python shortcuts",
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

      -- Create function for language-specific shortcuts
      local function show_language_cheatsheet()
        local lines = {
          "╭─────────────────────────────────────────────────────────╮",
          "│           🔧 Language-Specific Shortcuts                │",
          "╰─────────────────────────────────────────────────────────╯",
          "",
          "  ╭───────────────────────────────────────────────────────╮",
          "  │                    🐹 Go Development                  │",
          "  ╰───────────────────────────────────────────────────────╯",
          "",
          "  Struct Tags (gopher.nvim)",
          "  ─────────────────────────",
          "  <leader>Gt    Add json tags     Add json struct tags",
          "  <leader>GT    Remove json       Remove json tags",
          "  <leader>Gy    Add yaml tags     Add yaml struct tags",
          "  <leader>Gx    Clear all tags    Remove all struct tags",
          "",
          "  Code Generation",
          "  ───────────────",
          "  <leader>Gi    Implement         Implement interface stubs",
          "  <leader>Ge    If err            Generate if err != nil block",
          "  <leader>Gc    Comment           Generate doc comment",
          "  <leader>Gf    Fill struct       Fill struct with defaults",
          "  <leader>Gp    Fill switch       Fill switch cases",
          "",
          "  Testing",
          "  ───────",
          "  <leader>Ga    Add test          Generate test for function",
          "  <leader>GA    Add all tests     Generate tests for all funcs",
          "  <leader>GE    Add exported      Tests for exported funcs only",
          "  <leader>Gv    Alt file          Toggle test ↔ implementation",
          "  <leader>GV    Alt vsplit        Open alt file in vsplit",
          "",
          "  Running & Building",
          "  ──────────────────",
          "  <leader>Gr    Go run            Run current file/package",
          "  <leader>Gs    Go stop           Stop running process",
          "  <leader>Gm    Go mod tidy       Tidy go.mod dependencies",
          "  <leader>Gl    Go lint           Run golangci-lint",
          "  <leader>Gd    Go doc            Show documentation",
          "",
          "  LSP Features (gopls)",
          "  ────────────────────",
          "  gd            Definition        Jump to definition",
          "  gr            References        Find all references",
          "  K             Hover             Show documentation",
          "  <leader>la    Code actions      Organize imports, etc.",
          "  <leader>lr    Rename            Rename symbol",
          "",
          "  ╭───────────────────────────────────────────────────────╮",
          "  │                  🐍 Python Development                │",
          "  ╰───────────────────────────────────────────────────────╯",
          "",
          "  Virtual Environments",
          "  ────────────────────",
          "  <leader>pv    Select venv       Choose virtualenv (Telescope)",
          "  <leader>pV    Cached venv       Select from cached venvs",
          "                                  Supports: venv, poetry, conda, uv",
          "",
          "  REPL (iron.nvim)",
          "  ────────────────",
          "  <leader>pr    Open REPL         Start IPython/Python REPL",
          "  <leader>pR    Restart REPL      Restart the REPL",
          "  <leader>pH    Hide REPL         Hide REPL window",
          "  <leader>ps    Send selection    Send visual selection to REPL",
          "  <leader>pl    Send line         Send current line to REPL",
          "  <leader>pp    Send paragraph    Send paragraph to REPL",
          "  <leader>pf    Send file         Send entire file to REPL",
          "  <leader>pu    Send until cursor Send from start to cursor",
          "  <leader>pc    Clear REPL        Clear REPL output",
          "  <leader>pq    Quit REPL         Close REPL session",
          "",
          "  Testing (neotest)",
          "  ─────────────────",
          "  <leader>tt    Run nearest       Run test under cursor",
          "  <leader>tf    Run file          Run all tests in file",
          "  <leader>ts    Run suite         Run entire test suite",
          "  <leader>to    Show output       Show test output",
          "  <leader>tS    Stop              Stop running tests",
          "",
          "  LSP Features (basedpyright)",
          "  ───────────────────────────",
          "  gd            Definition        Jump to definition",
          "  gr            References        Find all references",
          "  K             Hover             Show documentation/types",
          "  <leader>la    Code actions      Quick fixes, imports",
          "  <leader>lr    Rename            Rename symbol",
          "",
          "  Documentation (neogen)",
          "  ──────────────────────",
          "  <leader>nf    Function doc      Generate function docstring",
          "  <leader>nc    Class doc         Generate class docstring",
          "  <leader>nt    Type doc          Generate type docstring",
          "",
          "  ╭───────────────────────────────────────────────────────╮",
          "  │                  🔍 Static Analysis                   │",
          "  ╰───────────────────────────────────────────────────────╯",
          "",
          "  Linters Enabled",
          "  ───────────────",
          "  Go:     golangci-lint (gosec, revive, gocritic, errorlint)",
          "  Python: ruff, mypy, basedpyright",
          "  Shell:  shellcheck",
          "  Docker: hadolint",
          "  YAML:   yamllint",
          "  TF:     tflint",
          "",
          "  Diagnostics",
          "  ───────────",
          "  <leader>xx    All diagnostics   Show all in Trouble",
          "  <leader>xX    Buffer diags      Current buffer only",
          "  ]d / [d       Next/prev         Jump between diagnostics",
          "",
          "  Help Cheatsheets",
          "  ────────────────",
          "  <leader>?     DevOps tools      Productivity & tools",
          "  <leader>??    Vim essentials    Basic Neovim commands",
          "  <leader>?l    This window       Language-specific (you are here)",
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
        local width = 63
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

        -- Set highlights for title box
        vim.api.nvim_buf_add_highlight(buf, -1, "Title", 1, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 0, 0, -1)
        vim.api.nvim_buf_add_highlight(buf, -1, "Comment", 2, 0, -1)

        -- Highlight section headers and keybindings
        for i, line in ipairs(lines) do
          -- Section boxes (Go/Python/Static Analysis headers)
          if line:match("^  ╭") or line:match("^  │") or line:match("^  ╰") then
            vim.api.nvim_buf_add_highlight(buf, -1, "Function", i - 1, 0, -1)
          end
          -- Sub-section headers
          if line:match("^  [%w%s%(%)]+$") and not line:match("^  ╭") then
            vim.api.nvim_buf_add_highlight(buf, -1, "Type", i - 1, 0, -1)
          end
          -- Keybindings
          if line:match("^  <leader>") or line:match("^  gd") or line:match("^  gr") or line:match("^  K ") or line:match("^  %]") then
            vim.api.nvim_buf_add_highlight(buf, -1, "String", i - 1, 2, 18)
          end
          -- Linter list items
          if line:match("^  Go:") or line:match("^  Python:") or line:match("^  Shell:") or line:match("^  Docker:") or line:match("^  YAML:") or line:match("^  TF:") then
            vim.api.nvim_buf_add_highlight(buf, -1, "Keyword", i - 1, 2, 10)
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

      opts.mappings.n["<leader>?l"] = {
        show_language_cheatsheet,
        desc = "Show language-specific shortcuts",
      }

      return opts
    end,
  },
}
