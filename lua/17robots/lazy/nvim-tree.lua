return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "kyazdani42/nvim-tree.lua",
    },
    config = function()
      require("nvim-tree").setup()
    end
  }
}
