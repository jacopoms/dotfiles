local cmp = require("cmp")
local lspkind = require("lspkind")
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  luasnip = "[LuaS]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
  emoji = "[Emoji]",
  treesitter = "[TS]",
  Copilot = { symbol = "", text = "[CP]" },
}

local compare = require("cmp.config.compare")
-- Setup Tabnine
-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 20,
--   sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = "..",
--   show_prediction_strength = true,
-- })

-- require("tabnine").setup({
--   disable_auto_comment = true,
--   accept_keymap = "<C-[>",
--   dismiss_keymap = "<C-]>",
--   debounce_ms = 800,
--   suggestion_color = { gui = "#808080", cterm = 244 },
--   exclude_filetypes = { "TelescopePrompt" },
-- })

-- Setup copilot.lua

-- require("copilot").setup({
--   suggestion = {
--     enabled = false,
--   },
--   panel = {
--     enabled = false,
--   },
-- })

-- require("copilot_cmp").setup()

cmp.setup({
  confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- Tab Completion.
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "copilot",   group_index = 2 },
    -- { name = "cmp_tabnine" },
    { name = "nvim_lsp" },
    { name = "luasnip",   option = { show_autosnippets = true } },
    { name = "buffer" },
    { name = "treesitter" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "emoji" },
  }),
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      -- require("cmp_tabnine.compare"),
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- options: "text_symbol" | "symbol_text"
      menu = source_mapping,
    }),
  },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Setting up luasnip and snippet

require("luasnip").filetype_extend("ruby", { "rails" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
