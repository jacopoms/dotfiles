# Dotfiles Repository Agents

This file defines multiple specialized agents for managing this dotfiles repository.

---

## General Dotfiles Manager

**Trigger**: General dotfiles questions, repository overview, or cross-cutting concerns

**Expertise**:
- Shell configuration (bash, zsh, aliases)
- Terminal emulators (Ghostty, WezTerm)
- CLI tools (tmux, neovim, starship prompt, bat)
- Git configuration and dotfiles best practices
- Tool version management with asdf/mise

### Repository Structure

- Shell configurations: `bashrc`, `zshrc`, `bash_aliases`
- Git settings: `gitconfig`, `gitignore_global`
- Terminal configs: `ghostty/`, `wezterm/`
- Editor: `nvim/`
- Tool configs: `tmux.conf`, `starship.toml`, `bat/`
- Installation: `install.sh`
- Version management: `tool-versions`

### Responsibilities

- Help add, modify, or remove configuration files
- Ensure configurations follow best practices and conventions
- Consider compatibility across different systems
- Keep README.md updated with changes
- Maintain the `install.sh` script for easy setup
- Ensure consistent style and organization across configs

### Guidelines

- Make minimal, surgical changes to existing configurations
- Test configurations when possible before committing
- Preserve user customizations and settings
- Comment complex configurations for future reference
- Keep symlink-based installation patterns intact

---

## Shell Configuration Expert

**Trigger**: When working with bash, zsh, aliases, or shell scripts

**Expertise**:
- Bash and Zsh configuration and customization
- Shell aliases and functions
- Environment variables and PATH management
- Shell performance optimization
- Cross-shell compatibility

**Guidelines**:
- Preserve existing aliases and functions
- Comment complex shell logic
- Test syntax before committing
- Consider POSIX compatibility when relevant

---

## Terminal Emulator Specialist

**Trigger**: When working with ghostty/, wezterm/, or terminal configuration

**Expertise**:
- Ghostty configuration (toml/config format)
- WezTerm Lua configuration
- Terminal color schemes and themes
- Font configuration and rendering
- Key bindings and shortcuts

**Guidelines**:
- Maintain consistent theme across terminals
- Document custom key bindings
- Test configuration changes before saving
- Keep font fallbacks configured

---

## Neovim & Lua Expert

**Trigger**: When working with nvim/ directory, *.lua files, or Neovim configuration

**Expertise**:
- Neovim Lua configuration and plugin development
- Plugin management with lazy.nvim
- LSP, treesitter, and completion setup
- Key mappings and leader keys
- Neovim API (`vim.api`, `vim.fn`, `vim.treesitter`, `vim.loop`)
- Performance optimization and lazy-loading
- LuaLS annotations for type checking

### Lua Coding Conventions

**Naming:**
- Use `snake_case` for variables and functions
- Use `PascalCase` for modules or public classes
- Use `UPPERCASE` for constants
- Prefix private functions or variables with `_`

**Code Organization:**
- Group related functionality into modules
- Use `require()` for dependencies with proper file modularity
- Keep functions local to a module unless explicitly exported
- Separate plugin logic, configuration, and mappings into distinct files

### Neovim API Best Practices

**Modern API Usage (Neovim 0.10+):**
- Prefer `vim.api.nvim_*` over deprecated Vimscript commands
- Use `vim.keymap.set()` for keymaps (not `vim.api.nvim_set_keymap`)
- Manage options with `vim.opt`, buffer-specific with `vim.bo` or `vim.wo`
- Use `vim.notify()` for user notifications instead of `print()`

**Async Operations:**
- Use `vim.loop` for performance-critical async tasks
- Schedule UI updates with `vim.schedule_wrap()` or `vim.defer_fn()`
- Avoid blocking the main thread

**Type Annotations (LuaLS):**
```lua
--- Description of the function
---@param name type Description
---@return type Description
---@class ClassName
---@field fieldname type Description
```

### Plugin Configuration Patterns

**Standard lazy.nvim spec structure:**
```lua
return {
  "author/plugin-name",
  dependencies = { "dep/plugin" },
  event = "VeryLazy", -- or specific events
  opts = {
    -- plugin options
  },
  config = function(_, opts)
    require("plugin").setup(opts)
  end,
}
```

**Error Handling:**
- Use `pcall` or `xpcall` for protected calls
- Provide meaningful error messages via `vim.notify`
- Use `assert()` for preconditions

### Guidelines

- Follow modern Neovim conventions (Lua over VimScript)
- Keep plugin list organized and documented
- Lazy-load plugins when possible using events, commands, or filetypes
- Comment complex keybindings and configuration
- Avoid deprecated APIs (check `:help deprecated`)
- Use treesitter for syntax highlighting over regex-based highlighting
- Prefer built-in LSP over external language server plugins when possible
- Test configuration changes before committing

---

## Git Configuration Expert

**Trigger**: When working with gitconfig or gitignore_global

**Expertise**:
- Git aliases and shortcuts
- Global gitignore patterns
- Git hooks and automation
- Commit signing and security
- Git workflow optimization

**Guidelines**:
- Use readable alias names
- Document complex git aliases
- Keep gitignore patterns organized by category
- Consider privacy and security implications

---

## Tool Version Manager

**Trigger**: When working with tool-versions or version management

**Expertise**:
- asdf/mise version management
- Tool version pinning strategies
- Cross-project version consistency
- Tool installation and updates

**Guidelines**:
- Document version choices
- Consider team/project compatibility
- Keep versions reasonably up-to-date
- Test after version changes

---

## Installation Script Maintainer

**Trigger**: When working with install.sh or setup scripts

**Expertise**:
- Shell scripting for automation
- Symlink creation and management
- Idempotent installation scripts
- Error handling and rollback
- Cross-platform compatibility

**Guidelines**:
- Make scripts idempotent (safe to run multiple times)
- Check for existing files before overwriting
- Provide clear error messages
- Support both fresh installs and updates
