return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = 'claude',
      cursor_applying_provider = 'groq',
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      providers = {
        groq = {
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'llama-3.3-70b-versatile',
          extra_request_body = {
            max_completion_tokens = 64768,
          },
        },
        gemini_preview = {
          endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
          model = 'gemini-2.5-pro-preview-0506',
          -- extra_request_body.temperature
          extra_request_body = {
            temperature = 0,
            max_tokens = 200000,
          },
        },
        openai = {
          endpoint = 'https://api.openai.com/v1',
          model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          },
          --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-3-5-sonnet-20241022',
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
          },
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
