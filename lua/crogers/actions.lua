local telescope = require('telescope.builtin')

local function is_cursor_on_definition()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000)

  if result then
    for _, server_results in pairs(result) do
      for _, location in pairs(server_results.result or {}) do
        -- Convert location to a position
        local uri = location.targetUri or location.uri
        local range = location.targetRange or location.range
        if uri and range then
          -- Convert URI to a file path
          local filepath = vim.uri_to_fname(uri)
          local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}
          local current_file = vim.fn.expand("%:p") -- Current file's full path

          if current_file == filepath then
            local definition_line = range.start.line
            local cursor_line = cursor_pos[1] - 1 -- Convert 1-based to 0-based
            if definition_line == cursor_line then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

local function goto_definition_or_show_usages()
  if is_cursor_on_definition() then
    telescope.lsp_references()
  else
    vim.lsp.buf.definition()
  end
end

return {
  goto_definition_or_show_usages = goto_definition_or_show_usages,
}
