local function shorter_name(filename)
    -- This function is used to shorten the name of the virtual environment in the telescope results
    return filename:gsub(os.getenv "HOME", "~"):gsub("/bin/python", "")
end

return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
    },
    opts = {
        options = {
            -- If you put the callback here as a global option, its used for all searches (including the default ones by the plugin)
            on_telescope_result_callback = shorter_name,
        },
        -- search = {
        --     my_venvs = {
        --         command = "fd python$ ~/Code", -- Sample command, need to be changed for your own venvs
        --         -- If you put the callback here, its only called for your "my_venvs" search
        --         on_telescope_result_callback = shorter_name,
        --     },
        -- },
    },
}
