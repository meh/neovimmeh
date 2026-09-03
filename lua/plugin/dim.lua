-- [nfnl] fnl/plugin/dim.fnl
module(config.plugin.dim, {[autoload] = {[nvim] = aniseed.nvim, [dim] = dim}})
return dim.setup({})
