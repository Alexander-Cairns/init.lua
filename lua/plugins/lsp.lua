return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    -- Snippet Collection (Optional)
    'rafamadriz/friendly-snippets',
  },
  config = function()

    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}

    cmp.setup({
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      }
    })

    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
      }
    })

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<M-[>", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "<M-]>", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      -- Replace the language servers listed here 
      -- with the ones you want to install
      ensure_installed = {'tsserver', 'rust_analyzer'},
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        ['yamlls'] = function ()
          require("lspconfig").yamlls.setup {
            settings = {
              yaml = {
                schemas = {
                  ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.template.yaml",
                },
                customTags = {
                  "!fn",
                  "!And",
                  "!If",
                  "!Not",
                  "!Equals",
                  "!Or",
                  "!FindInMap sequence",
                  "!Base64",
                  "!Cidr",
                  "!Ref",
                  "!Ref Scalar",
                  "!Sub",
                  "!GetAtt",
                  "!GetAZs",
                  "!ImportValue",
                  "!Select",
                  "!Split",
                  "!Join sequence"
                },
              }
            }
          }
        end

      },
    })

  end,
}
