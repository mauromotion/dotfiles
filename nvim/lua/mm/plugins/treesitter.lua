-- [[ Con***REMOVED***gure Treesitter ]]
-- Treesitter folds
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 99

require('nvim-treesitter.con***REMOVED***gs').setup({
    -- nvim-treesitter/nvim-treesitter (self con***REMOVED***g)
    auto_install = true,
    ensure_installed = {
        'regex',
        'lua',
        'rust',
        'go',
        'javascript',
        'typescript',
        'tsx',
        'markdown',
        'markdown_inline',
        'html',
        'css',
        'json',
        'bash',
		'query',
		'***REMOVED***sh',
		'yaml',
		'python',
		'vim',
		'scss',
    ***REMOVED***,
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    ***REMOVED***,
    indent = {
        enable = true,
    ***REMOVED***,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gs',
            -- NOTE: These are visual mode mappings
            node_incremental = 'gs',
            node_decremental = 'gS',
            scope_incremental = '<leader>gc',
        ***REMOVED***,
    ***REMOVED***,
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups de***REMOVED***ned in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['uc'] = '@comment.outer',

                -- Or you can de***REMOVED***ne your own textobjects like this
                -- ["iF"] = {
                --     python = "(function_de***REMOVED***nition) @function",
                --     cpp = "(function_de***REMOVED***nition) @function",
                --     c = "(function_de***REMOVED***nition) @function",
                --     java = "(method_declaration) @function",
                -- ***REMOVED***,
            ***REMOVED***,
        ***REMOVED***,
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
                ['<leader>f'] = '@function.outer',
                ['<leader>e'] = '@element',
            ***REMOVED***,
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
                ['<leader>F'] = '@function.outer',
                ['<leader>E'] = '@element',
            ***REMOVED***,
        ***REMOVED***,
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']f'] = '@function.outer',
                [']]'] = '@class.outer',
            ***REMOVED***,
            goto_next_end = {
                [']F'] = '@function.outer',
                [']['] = '@class.outer',
            ***REMOVED***,
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[['] = '@class.outer',
            ***REMOVED***,
            goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[]'] = '@class.outer',
            ***REMOVED***,
        ***REMOVED***,
    ***REMOVED***,
    -- windwp/nvim-ts-autotag
    autotag = {
        enable = true,
    ***REMOVED***,
    -- nvim-treesitter/playground
    playground = {
        enable = true,
        disable = {***REMOVED***,
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
    ***REMOVED***,
    -- nvim-treesitter/nvim-treesitter-refactor
    refactor = {
        highlight_de***REMOVED***nitions = { enable = true ***REMOVED***,
        -- highlight_current_scope = { enable = false ***REMOVED***,
    ***REMOVED***,
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    ***REMOVED***,
***REMOVED***)
