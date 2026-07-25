local dap = require("dap")

local codelldb = {
    name = "Launch file",
    type = "codelldb",
    request = "launch",

    program = function()
        return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,

    cwd = "${workspaceFolder}",
    stopOnEntry = false,
}

dap.configurations.c = {
    codelldb,
}

dap.configurations.cpp = {
    codelldb,
}
