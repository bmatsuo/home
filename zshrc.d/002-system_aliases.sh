# alias `help` for shell builtin documentation (like in bash)
#   help echo
#   help pushd
if [ -d "/usr/share/zsh/${ZSH_VERSION}/help" ]; then
   if (( ${+aliases[run-help]} )); then
       unalias run-help # run-help is initially an alias for `man`
       autoload run-help
   fi
   HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
   alias help=run-help
fi

# pushd + dirs
alias dirp="dirs -p"
alias dirv="dirs -v"
