return {
  "ibhagwan/fzf-lua",
  config = function()
    require'fzf-lua'.setup{
      files = {
        actions = {
          ['ctrl-h'] = function(_, args)
            if args.cmd:find('--hidden') then
              args.cmd = args.cmd:gsub('--hidden', '', 1)
            else
              args.cmd = args.cmd .. ' --hidden'
            end
            require'fzf-lua'.resume()
          end
        },
        fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude .jj]],
        --formatter = 'path.filename_first',
      },
      winopts = {
        preview = {
          layout = 'vertical',
          vertical = 'up:80%'
        }
      }
    }
  end,
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { '<leader>b', function() require'fzf-lua'.buffers{winopts = { preview = { hidden = true } }} end },
    { '<leader>f', function() require'fzf-lua'.files() end },
    { '<leader>/', function() require'fzf-lua'.live_grep() end },
    { '<leader>u', function() require'fzf-lua'.changes() end },
  },
}
