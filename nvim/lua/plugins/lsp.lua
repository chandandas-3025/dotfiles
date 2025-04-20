return {
  -- Lua LSP support for Neovim config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- LSP and linting setup combined
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = {
        ensure_installed = {
          -- LSPs
          'lua-language-server', 'clangd', 'jdtls', 'pyright', 'ts_ls', 'html', 'cssls', 'tailwindcss', 'jsonls', 'yamlls', 'marksman', 'kotlin_language_server', 'emmet-ls', 'dockerls', 'bashls',
          -- Linters
          'luacheck', 'markdownlint', 'jsonlint', 'ts-standard', 'misspell',
          -- Formatters
          'prettier',
          },
        auto_update = true,
        run_on_start = true,
      }},
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
      'mfussenegger/nvim-lint',
    },

    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        c = { 'cppcheck' },
        cpp = { 'cppcheck' },
        cc = { 'cppcheck' },
        lua = { 'luacheck' },
        markdown = { 'markdownlint' },
        json = { 'jsonlint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
        callback = function()
          lint.try_lint()
        end,
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local function supports(client, method)
            return client and client.supports_method and client:supports_method(method)
          end

          if supports(client, vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_group = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              group = highlight_group,
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              group = highlight_group,
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = highlight_group, buffer = event2.buf }
              end,
            })
          end

          if supports(client, vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        clangd = {}, jdtls = {}, pyright = {}, html = {}, cssls = {}, ts_ls = {},
        tailwindcss = {}, jsonls = {}, yamlls = {}, marksman = {}, kotlin_language_server = {},
        emmet_ls = {}, dockerls = {}, bashls = {}, 
      }

      require('mason').setup()

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
        handlers = {
          function(server_name)
            local name = server_name
            require('lspconfig')[name].setup {
              capabilities = capabilities,
              settings = servers[server_name] or {},
            }
          end,
        },
      }
    end,
  },
}
