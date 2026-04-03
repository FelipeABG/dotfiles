-- After any change of a plugin's state (event 'PackChanged'), executes the following callback
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function()
        -- Remove plugins marked as 'not active' from disk
        vim.pack.del(
            vim.iter(vim.pack.get())
            :filter(function(x) return not x.active end)
            :map(function(x) return x.spec.name end)
            :totable()
        )
    end
})
