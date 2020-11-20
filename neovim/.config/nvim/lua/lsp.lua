local lspconfig = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

lspconfig.bashls.setup({ on_attach=on_attach })
lspconfig.cssls.setup({ on_attach=on_attach })
lspconfig.dockerls.setup({ on_attach=on_attach })
lspconfig.gopls.setup({ on_attach=on_attach })
lspconfig.html.setup({ on_attach=on_attach })
lspconfig.jsonls.setup({ on_attach=on_attach })
lspconfig.rust_analyzer.setup({ on_attach=on_attach })
lspconfig.solargraph.setup({ on_attach=on_attach })
lspconfig.sqlls.setup({ on_attach=on_attach })
lspconfig.sumneko_lua.setup({ on_attach=on_attach })
lspconfig.terraformls.setup({ on_attach=on_attach })
lspconfig.tsserver.setup({ on_attach=on_attach })
lspconfig.vimls.setup({ on_attach=on_attach })
lspconfig.vuels.setup({ on_attach=on_attach })
lspconfig.yamlls.setup({ on_attach=on_attach })

