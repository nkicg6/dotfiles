-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
-- vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
-- vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
-- vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><C-n>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><C-p>', '<cmd>lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
