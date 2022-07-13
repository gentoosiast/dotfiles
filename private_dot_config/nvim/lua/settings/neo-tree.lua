-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require'neo-tree'.setup({
    filesystem = {
        use_libuv_file_watcher = true
    },
    nesting_rules = {
        ["css"] = { "css.map" },
        ["js"] = { "js.map" }
    }
})
