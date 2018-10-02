" Vim syntax file
" Language:     Arango AQL.
" Last Changed: Thu Jul 27 02:00 PM 2014 EST

syn case ignore

" All non-contained SQL syntax.
syn cluster aqlALL          contains=TOP

" Various error conditions.
syn match   aqlError        ")"                 " Lonely closing paren.
syn match   aqlError        ",\(\_\s*[;)]\)\@=" " Comma before a paren or semicolon.

" Special words.
syn keyword aqlSpecial      false null true

" Keywords.
syn keyword aqlKeyword      aggregate all and any asc collect desc distinct
syn keyword aqlKeyword      false filter for graph in inbound insert into
syn keyword aqlKeyword      let limit none not null or outbound remove
syn keyword aqlKeyword      replace return shortest_path sort true update
syn keyword aqlKeyword      upsert with 

" Operators
syn match   aqlOperator     "||\|:="

" Conditionals
syn match   aqlConditional  "=\|<\|>\|+\|-"

" Unknown functions.
syn match   aqlUnknownFunc  "\<\w\+(\@="

" Functions - Only valid with a '(' after them.
"    Type cast functios
syn match   aqlFunction     "\<\(to_bool\|to_number\|to_string\|to_array\|to_list\)(\@="
syn match   aqlFunction     "\<\(is_null\|is_bool\|is_number\|is_string\|is_array\)(\@="
syn match   aqlFunction     "\<\(is_list\|is_object\|is_document\|is_datestring\|typename\)(\@="
"    String functions
syn match   aqlFunction     "\<\(char_length\|concat\|concat_separator\|contains\|count\)(\@="
syn match   aqlFunction     "\<\(find_first\|find_last\|left\|length\|like\)(\@="
syn match   aqlFunction     "\<\(lower\|ltrim\|md5\|random_token\|regex_test\)(\@="
syn match   aqlFunction     "\<\(right\|reverse\|rtrim\|sha1\|split\)(\@="
syn match   aqlFunction     "\<\(substitute\|substring\|trim\|upper\)(\@="
"    Numeric
syn match   aqlFunction     "\<\(abs\|acos\|asin\|atan\|atan2\?\|average\|ceil\)(\@="
syn match   aqlFunction     "\<\(cos\|degrees\|exp\|exp2\|floor\|log\|log2\?\)(\@="
syn match   aqlFunction     "\<\(log10\|max\|median\|min\|percentile\|pi\)(\@="
syn match   aqlFunction     "\<\(pow\|radians\|rand\|range\|round\|sin\)(\@="
syn match   aqlFunction     "\<\(sqrt\|stddev_population\|stddev_sample\|sum\|tan\)(\@="
syn match   aqlFunction     "\<\(variance_population\|variance_sample\)(\@="
"    Date
syn match   aqlFunction     "\<\(date_now\|date_timestamp\|date_iso8601\|is_datestring\)(\@="
syn match   aqlFunction     "\<\(date_dayofweek\|date_year\|date_month\|date_hour\)(\@="
syn match   aqlFunction     "\<\(date_minute\|date_second\|date_millisecond\|date_dayofyear\)(\@="
syn match   aqlFunction     "\<\(date_isoweek\|date_leapyear\|date_quarter\|date_days_in_month\)(\@="
syn match   aqlFunction     "\<\(date_format\|date_add\|date_subtract\|date_diff\)(\@="
syn match   aqlFunction     "\<\(date_compare\)(\@="
"    Array
syn match   aqlFunction     "\<\(append\|count\|first\|flatten\|intersection\)(\@="
syn match   aqlFunction     "\<\(last\|length\|minus\|nth\|pop\|position\|push\)(\@="
syn match   aqlFunction     "\<\(remove_nth\|remove_value\|remove_values\|reverse\|shift\)(\@="
syn match   aqlFunction     "\<\(shift\|slice\|union\|union_distinct\|unique\|unshift\)(\@="
"    Object / Document Functions
syn match   aqlFunction     "\<\(attributes\|count\|has\|is_same_collection\|keep\|length\)(\@="
syn match   aqlFunction     "\<\(matches\|merge\|merge_recursive\|parse_identifier\|translate\|unset\)(\@="
syn match   aqlFunction     "\<\(unset_recursive\|values\|zip\)(\@="
"    Geo
syn match   aqlFunction     "\<\(near\|within\|within_rectangle\|is_in_polygon\)(\@="
"    Fulltext Indexes
syn match   aqlFunction     "\<\(fulltext\)(\@="
"    Misc
syn match   aqlFunction     "\<\(not_null\|first_list\|first_document\|collection_count\|collections\)(\@="
syn match   aqlFunction     "\<\(count\|current_user\|document\|length\|hash\)(\@="
syn match   aqlFunction     "\<\(apply\|call\|fail\|noopt\|passthru\|sleep\|v8\)(\@="

" Strings
syn region aqlString        start=+"+  skip=+\\\\\|\\"+  end=+"+ 
syn region aqlString        start=+'+  skip=+\\\\\|\\'+  end=+'+ 
syn region aqlString        start=+`+  skip=+\\\\\|\\`+  end=+`+ 

" Numbers
syn match aqlNumber         "-\=\<[0-9]*\>"
syn match aqlNumber         "-\=\<[0-9]*\.[0-9]*\>"
syn match aqlNumber         "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match aqlNumber         "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match aqlNumber         "\<0x[abcdef0-9]*\>"

" Todo
syn keyword aqlTodo         contained DEBUG FIXME NOTE TODO XXX

" Comments
syn match  aqlComment       "//.*"

" Mark correct paren use. Different colors for different purposes.
syn region  aqlParens       transparent matchgroup=aqlParen start="(" end=")"
syn match   aqlParenEmpty   "()"
syn region  aqlParens       transparent matchgroup=aqlParenFunc start="\(\<\w\+\>\)\@<=(" end=")"

" Stolen from sh.vim.
if !exists("sh_minlines")
  let sh_minlines = 200
endif
if !exists("sh_maxlines")
  let sh_maxlines = 2 * sh_minlines
endif
exec "syn sync minlines=" . sh_minlines . " maxlines=" . sh_maxlines

" Define the default highlighting.
if version >= 508 || !exists("did_aql_syn_inits")
    if version < 508
        let did_aql_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink aqlComment       Comment
    HiLink aqlError         Error
    HiLink aqlFunction      Function
    HiLink aqlUnknownFunc   Exception
    HiLink aqlKeyword       Special
    HiLink aqlConditional   Conditional
    HiLink aqlNumber        Number
    HiLink aqlOperator      Operator
    HiLink aqlParen         Comment
    HiLink aqlParenEmpty    Operator
    HiLink aqlParenFunc     Function
    HiLink aqlSpecial       Keyword
    HiLink aqlString        String
    HiLink aqlTodo          Todo
    HiLink aqlType          Type

    delcommand HiLink
endif

let b:current_syntax = "aql"
