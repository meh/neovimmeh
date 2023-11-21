(module config.plugin.navic
  {autoload {nvim aniseed.nvim
             navic nvim-navic}})

(navic.setup {:lsp {:auto_attach true}
              :separator " │ "
              :icons {
                :File ""
                :Module "mod "
                :Namespace "ns "
                :Package "pkg "
                :Class "class "
                :Method ""
                :Property ""
                :Field ""
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
                :Null ""
                :EnumMember ""
                :Struct "struct "
                :Event ""
                :Operator ""
                :TypeParameter "type "}})
