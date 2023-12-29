(module config.plugin.navic
  {autoload {nvim aniseed.nvim
             navic nvim-navic}})

(navic.setup {:lsp {:auto_attach true}
              :separator " │ "
              :icons {
                :File "fs "
                :Module "mod "
                :Namespace "ns "
                :Package "pkg "
                :Class "class "
                :Method "fn "
                :Property ". "
                :Field ". "
                :Constructor "new "
                :Enum "enum "
                :Interface "trait "
                :Function "fn "
                :Variable "var "
                :Constant "const "
                :String ""
                :Number ""
                :Boolean ""
                :Array ""
                :Object ""
                :Key ""
                :Null "null"
                :EnumMember ""
                :Struct "struct "
                :Event ""
                :Operator ""
                :TypeParameter "type "}})
