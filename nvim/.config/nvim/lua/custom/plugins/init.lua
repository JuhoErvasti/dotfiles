return {
  {
    "xiyaowong/transparent.nvim",
  },

  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "https://git.sr.ht/~foosoft/argonaut.nvim",
    config = function ()
      require("argonaut").setup({
          brace_last_indent = false,
          brace_last_wrap = true,
          brace_pad = false,
          comma_last = true,
          comma_prefix = false,
          comma_prefix_indent = false,
          limit_cols = 512,
          limit_rows = 64,
      })
    end
  },
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-completion",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
  },
}
