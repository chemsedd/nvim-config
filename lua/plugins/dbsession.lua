return {
    "glepnir/dbsession.nvim",
    cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
    config = function()
        require("dbsession").setup {}
    end,
}
