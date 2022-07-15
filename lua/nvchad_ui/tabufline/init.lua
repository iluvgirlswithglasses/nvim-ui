local tabufline_opts = require("nvchad_ui").tabufline

return {
   setup = function(opts)
      tabufline_opts = vim.tbl_deep_extend("force", tabufline_opts, opts.tabufline or {})

      local modules = require "nvchad_ui.tabufline.modules"

      -- merge user modules :D
      if tabufline_opts.overriden_modules then
         modules = vim.tbl_deep_extend("force", modules, tabufline_opts.overriden_modules())
      end

      return modules.CoverNvimTree() .. modules.bufferlist() .. (modules.tablist() or "") .. modules.buttons()
   end,
}
