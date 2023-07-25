vim.keymap.set("n", "<leader>g", vim.cmd.Git)

local fugitive = vim.api.nvim_create_augroup("fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = bim.api.nvim_get_current_buf()
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({'pull', '--rebase'})
    end, opts)

    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
  end,
})
