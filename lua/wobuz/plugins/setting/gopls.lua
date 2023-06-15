return {
    flags = {allow_incremental_sync = false, debounce_text_changes = 500},
    settings = {
        gopls = {
            usePlaceholders = true,
            semanticTokens = true,
            experimentalPostfixCompletions = true,
            analyses = {unusedparams = true, shadow = true},
            staticcheck = true
        }
    }
}
