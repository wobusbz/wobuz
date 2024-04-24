return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "VeryLazy",
    cmd = {
        "ToggleTerm", "TermExec", "ToggleTermToggleAll",
        "ToggleTermSendCurrentLine", "ToggleTermSendVisualLines",
        "ToggleTermSendVisualSelection"
    },
    config = function()
        local status_ok, toggleterm = pcall(require, 'toggleterm')
        if not status_ok then
            vim.notify("toggleterm not found")
            return
        end
        toggleterm.setup {
            active = true,
            on_config_done = nil,
            -- size can be a number or function which is passed the current terminal
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            persist_size = false,
            -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
            direction = "float",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = nil, -- change the default shell
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                border = "curved",
                -- width = <value>,
                -- height = <value>,
                winblend = 0,
                highlights = {border = "Normal", background = "Normal"}
            },
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            }
        }
    end
}
