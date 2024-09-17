return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.fn.expand '$HOME' .. '/.asdf/installs/nodejs/21.1.0/bin/node',
    },
  },
}
