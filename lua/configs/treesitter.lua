local M = {}

function M.setup()
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
      end

    local config = {
        on_config_done = nil,
        
        ensure_installed = { 'comment', 'markdown_inline', 'regex', 'markdown', 'javascript', 'rust', 'zig' },

        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    }

    require('nvim-treesitter.configs').setup(config)
end

return M
