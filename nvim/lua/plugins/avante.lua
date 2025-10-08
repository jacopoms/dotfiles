---@class avante.Config
local opts = {
  -- add any opts here
  -- for example
  provider = "gemini",
  providers = {
    ollama = {
      endpoint = "http://localhost:11434",
      -- Note: "gpt-oss:latest" seems to be a custom model.
      -- If this is a typo, you might want to use a standard model like "llama3" or "gemma".
      model = "gpt-oss:latest",
      is_env_set = function()
        return true
      end,
    },
  },
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub and hub:get_active_servers_prompt() or ""
  end,
  -- Using function prevents requiring mcphub before it's loaded
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool(),
    }
  end,
}

return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "gemini",
    -- providers = {
    --   ollama = {
    --     endpoint = "http://localhost:11434",
    --     -- Note: "gpt-oss:latest" seems to be a custom model.
    --     -- If this is a typo, you might want to use a standard model like "llama3" or "gemma".
    --     model = "gpt-oss:latest",
    --     is_env_set = function()
    --       return true
    --     end,
    --   },
    -- },
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
  },
  dependencies = {
    -- Core dependencies
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons

    -- Optional: UI for file selection. Choose one.
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "ibhagwan/fzf-lua", -- for file_selector provider fzf

    -- Optional: UI for vim.ui.input. Choose one.
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks

    -- Optional: Copilot provider
    "zbirenbaum/copilot.lua", -- for providers='copilot'

    -- Optional: Image pasting support
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },

    -- Optional: Markdown rendering
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
