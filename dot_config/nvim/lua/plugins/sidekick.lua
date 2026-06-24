local function toggle_open_terminal_layout(terminal)
  if not terminal then
    local ok, terminals = pcall(require, "sidekick.cli.terminal")
    if not ok then
      return
    end

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local id = vim.w[win].sidekick_session_id
      terminal = id and terminals.terminals[id] or nil
      if terminal and terminal:is_open() then
        break
      end
      terminal = nil
    end
  end

  if not terminal or not terminal:is_open() then
    return
  end

  local was_focused = terminal:is_focused()
  terminal.opts.layout = terminal.opts.layout == "float" and "right" or "float"
  terminal:hide()
  terminal:show()

  if was_focused then
    terminal:focus()
    vim.schedule(function()
      if terminal:is_open() and terminal:is_focused() and terminal:is_running() then
        vim.cmd.startinsert()
      end
    end)
  end
end

return {
  "folke/sidekick.nvim",
  keys = {
    { "<c-/>", toggle_open_terminal_layout, mode = { "n", "t" }, desc = "Toggle Sidekick terminal layout" },
    { "<c-_>", toggle_open_terminal_layout, mode = { "n", "t" }, desc = "Toggle Sidekick terminal layout" },
  },
  opts = {
    cli = {
      win = {
        layout = "float",
        float = {
          width = 0.85,
          height = 0.85,
        },
        keys = {
          toggle_layout = {
            "<c-_>",
            toggle_open_terminal_layout,
            mode = "nt",
            desc = "toggle terminal float/side layout",
          },
        },
      },
    },
  },
}
