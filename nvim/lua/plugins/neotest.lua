return {
  'nvim-neotest/neotest',
  dependencies = {
    {
      "nvim-lua/plenary.nvim"
    },
    {
      "nvim-treesitter/nvim-treesitter"
    },
    {
      "nvim-neotest/neotest-python"
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          args = {"--log-level", "DEBUG"},
        }),
      }
    })
  end,
  init = function()
    vim.keymap.set('n', '<leader>tr', function() require('neotest').run.run() end, { desc = '[t]est [r]un' })
    vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.expand("%")) end, { desc = '[t]est [a]ll' })
    vim.keymap.set('n', '<leader>td', function() require('neotest').run.run({strategy = "dap"}) end, { desc = '[t]est [d]ebug' })
    vim.keymap.set('n', '<leader>to', function() require('neotest').output_panel.toggle() end, { desc = '[t]est [o]utput' })
  end
}
