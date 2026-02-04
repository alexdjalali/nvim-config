-- Python/uv support
---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        basedpyright = {
          before_init = function(_, c)
            -- Auto-detect uv .venv
            local venv = vim.fn.getcwd() .. "/.venv"
            if vim.fn.isdirectory(venv) == 1 then
              c.settings.python.pythonPath = venv .. "/bin/python"
            end
          end,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
  },
}
