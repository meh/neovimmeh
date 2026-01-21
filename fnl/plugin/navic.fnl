(local navic (require :nvim-navic))

(navic.setup {:lsp {:auto_attach true
                    :preference ["ts_ls" "volar"]}
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
