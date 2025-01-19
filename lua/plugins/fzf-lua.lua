return function(use)
  use {
    "ibhagwan/fzf-lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("fzf-lua").setup{}
    end
  }
end
