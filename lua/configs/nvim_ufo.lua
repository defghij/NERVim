require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
  fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
    local result = {}
    local _end = end_lnum - 1
    local final_text = vim.trim(vim.api.nvim_buf_get_text(0, _end, 0, _end, -1, {})[1])
    local suffix = final_text:format(end_lnum - lnum)
    local suffix_width = vim.fn.strdisplaywidth(suffix)
    local target_width = width - suffix_width
    local cur_width = 0
    for _, chunk in ipairs(virt_text) do
      local chunk_text = chunk[1]
      local chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if target_width > cur_width + chunk_width then
        table.insert(result, chunk)
      else
        chunk_text = truncate(chunk_text, target_width - cur_width)
        local hl_group = chunk[2]
        table.insert(result, { chunk_text, hl_group })
        chunk_width = vim.fn.strdisplaywidth(chunk_text)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if cur_width + chunk_width < target_width then
          suffix = suffix .. (' '):rep(target_width - cur_width - chunk_width)
        end
        break
      end
      cur_width = cur_width + chunk_width
    end
    table.insert(result, { ' ⋯ ', 'NonText' })
    table.insert(result, { suffix, 'TSPunctBracket' })
    return result
  end
})


vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.cmd("hi Folded guibg=NONE")
vim.cmd("hi Folded ctermbg=NONE")
vim.cmd("hi Folded gui=NONE")
vim.cmd("hi Folded cterm=NONE")
vim.cmd("hi Type ctermbg=NONE")
vim.cmd("hi Comment ctermbg=NONE")
vim.cmd("hi RustDocComment ctermbg=NONE")

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
