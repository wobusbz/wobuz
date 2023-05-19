return {
    'numToStr/Comment.nvim',
    config = function()
        local status_ok, comment = pcall(require, "Comment")
        if not status_ok then return end
        comment.setup {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc'
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb'
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA'
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true
            },
            ---Function to call before (un)comment
            pre_hook = function(ctx)
                local U = require "Comment.utils"

                local status_utils_ok, utils = pcall(require,
                                                     "ts_context_commentstring.utils")
                if not status_utils_ok then return end

                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = utils.get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = utils.get_visual_start_location()
                end

                local status_internals_ok, internals = pcall(require,
                                                             "ts_context_commentstring.internals")
                if not status_internals_ok then return end

                return internals.calculate_commentstring {
                    key = ctx.ctype == U.ctype.line and "__default" or
                        "__multiline",
                    location = location
                }
            end,
            ---Function to call after (un)comment
            post_hook = nil
        }
    end
}
