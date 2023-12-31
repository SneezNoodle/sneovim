# Sneovim
My silly little neovim config that I spend way too much time working on. It is most likely messy in code, structure and commit history, but I'm learning (slowly). For example, much later, this readme file might be half decent.
Not sure what the actual version requirement is but I use **v0.9.4**.

## Directory structure
Under lua/sneez/:
- core/: Basic editor settings, loaded before plugins.
- plugins/: Plugin specs for Lazy. Each file is like a "directory" containing related plugins.
- lsp-settings.lua: Lspconfig setup tables.
- lazy-init.lua: Setup script for Lazy. Remove from init.lua to disable plugins.

