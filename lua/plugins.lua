local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://ghproxy.com/https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

function git_url(repo_name)
    return 'https://ghproxy.com/https://github.com/' .. repo_name .. '.git'
end

local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        url = git_url("nvim-treesitter/nvim-treesitter"),
        config = function()
            require('configs/treesitter').setup()
        end
    },
}

require('lazy').setup(plugins)
