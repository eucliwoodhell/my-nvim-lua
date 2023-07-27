local command = vim.api.nvim_create_user_command

command("PackerInstall",
        "packadd packer.nvim | lua require('_plugins').install()", {})
command("PackerUpdate",
        "packadd packer.nvim | lua require('_plugins').update()", {})
command("PackerClean", "packadd packer.nvim | lua require('_plugins').clean()",
        {})
command("PackerCompile",
        "packadd packer.nvim | lua require('_plugins').compile()", {})
command("PackerSync", "packadd packer.nvim | lua require('_plugins').sync()", {})
