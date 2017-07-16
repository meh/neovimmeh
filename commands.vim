command! -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | DISPLAY=:0.0 xclip
command! -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>
command! -nargs=1 IndentationLocal silent setlocal ts=<args> shiftwidth=<args>
