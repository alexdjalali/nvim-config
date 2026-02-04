-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Python settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Go settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

-- LazyDocker, K9s, LazySql, and Btop integration
local function setup_devops_tools()
  local status_ok, Terminal = pcall(require, "toggleterm.terminal")
  if not status_ok then
    return
  end

  -- LazyDocker terminal
  local lazydocker = Terminal.Terminal:new({
    cmd = "lazydocker",
    direction = "float",
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })

  -- K9s terminal
  local k9s = Terminal.Terminal:new({
    cmd = "k9s",
    direction = "float",
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })

  -- LazySql terminal
  local lazysql = Terminal.Terminal:new({
    cmd = "lazysql",
    direction = "float",
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })

  -- Btop terminal - floating like other tools
  local btop = Terminal.Terminal:new({
    cmd = "btop",
    direction = "float",
    float_opts = {
      border = "curved",
      width = function() return math.floor(vim.o.columns * 0.9) end,
      height = function() return math.floor(vim.o.lines * 0.9) end,
    },
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })

  -- Commands
  vim.api.nvim_create_user_command("LazyDocker", function()
    lazydocker:toggle()
  end, {})

  vim.api.nvim_create_user_command("K9s", function()
    k9s:toggle()
  end, {})

  vim.api.nvim_create_user_command("LazySql", function()
    lazysql:toggle()
  end, {})

  vim.api.nvim_create_user_command("Btop", function()
    btop:toggle()
  end, {})
end

-- Run after plugins are loaded
vim.defer_fn(setup_devops_tools, 100)

-- Prevent comment errors in non-modifiable buffers
local function safe_comment()
  if vim.bo.modifiable then
    return "gc"
  else
    vim.notify("Buffer is not modifiable", vim.log.levels.WARN)
    return ""
  end
end

vim.keymap.set({ "n", "v" }, "gc", safe_comment, { expr = true, desc = "Comment (safe)" })
vim.keymap.set("n", "gcc", function()
  if vim.bo.modifiable then
    return "gcc"
  else
    vim.notify("Buffer is not modifiable", vim.log.levels.WARN)
    return ""
  end
end, { expr = true, desc = "Comment line (safe)" })
