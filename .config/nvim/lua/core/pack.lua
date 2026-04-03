-- After any change of a plugin's state (event 'PackChanged'), executes the following callback
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local kind = event.data.kind
        if kind == "update" then
            -- Remove plugins marked as 'not active' from disk
            vim.pack.del(
                vim.iter(vim.pack.get())
                :filter(function(x) return not x.active end)
                :map(function(x) return x.spec.name end)
                :totable()
            )
        end
    end
})

-- Autocommands to build plugin dependencies after installing and before laoding it.
-- Check the `vim.pack-events` section of the `vim.pack` documentation
-- to understand why this is here and not on each plugin config file.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local plugin_name, kind = event.data.spec.name, event.data.kind

        if plugin_name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
            vim.system({ "make" }, { cwd = event.data.path }):wait()
        end
    end
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(event)
        local plugin_name, kind = event.data.spec.name, event.data.kind

        if plugin_name == 'blink.cmp' and (kind == "install" or kind == "update") then
            vim.system({ 'cargo', 'build', '--release' }, { cwd = event.data.path }):wait()
        end
    end,
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            vim.cmd('TSUpdate')
        end
    end
})
