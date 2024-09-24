return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable specific keymaps
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gr", false }
    keys[#keys + 1] = { "gR", false }

    -- Merge the existing opts with our new configuration
    return vim.tbl_deep_extend("force", opts, {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        html = { filetypes = { "xhtml", "html" } },
        cssls = {
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  snippetSupport = true,
                },
              },
            },
          },
        },
        vtsls = {
          keys = {
            {
              "gD",
              function()
                local params = vim.lsp.util.make_position_params()
                LazyVim.lsp.execute({
                  command = "typescript.goToSourceDefinition",
                  arguments = { params.textDocument.uri, params.position },
                  open = true,
                })
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              false,
            },
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              LazyVim.lsp.action["source.fixAll.ts"],
              desc = "Fix all diagnostics",
            },
            {
              "<leader>cV",
              function()
                LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
              end,
              desc = "Select TS workspace version",
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "html",
            "xhtml",
            "xml",
            "htmldjango",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "typescriptreact",
          },
        },
      },
    })
  end,
}
