local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/arch/.local/share/nvim/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.c = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = "${fileBasenameNoExtension}",
        cwd = '${workspaceFolder}',
        externalConsole = false,
    }
}
