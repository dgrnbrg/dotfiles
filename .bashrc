_lein_completion() {
        local cur prev tasks
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        tasks="check classpath clean compile deploy deps help install jar javac new pom repl retest run search swank test trampoline uberjar upgrade version with-profile vimclojure marg kibit autoexpect"

        case "${prev}" in
                check | classpath | clean | deploy | deps | install | jar | javac | new | pom | repl | swank | uberjar | version)
                        COMPREPLY=()
                        ;;
                help)
                        # Show tasks again, but only once; don't infinitely recurse
                        local prev2="${COMP_WORDS[COMP_CWORD-2]}"
                        if [ "$prev2" == "help" ]; then
                                COMPREPLY=()
                        else
                                COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
                        fi
                        ;;
                test | retest )
                        # list project's test namespaces:
                        local namespaces=$(find test/ -type f -name "*.clj" -exec sed -n 's/^(ns[ ]*//p' '{}' '+')
                        COMPREPLY=( $(compgen -W "${namespaces}" -- ${cur}) )
                        ;;
                run | compile)
                        # list project's src namespaces:
                        local namespaces=$(find src/ -type f -name "*.clj" -exec sed -n 's/^(ns[ ]*//p' '{}' '+')
                        COMPREPLY=( $(compgen -W "${namespaces}" -- ${cur}) )
                        ;;
                lein2)
                        COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
                        ;;
                lein)
                        COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
                        ;;
        esac

        return 0
}
complete -F _lein_completion lein

source /usr/local/etc/bash_completion.d/hub.bash_completion.sh

export PS1="\[\033[1;36m\]\u\[\033[1;33m\]:\[\033[32m\]\w\[\033[0m\] \$ "
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/dgrnbrg/bin
export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.4/libexec
alias ...='cd ../..'
function ..() {
    if [ $1 ]; then
        local SEDPATTERN='/'"$1"'/,$p'
        cd "$(echo $PWD | tr '/' '\n' | tail -r | sed -n $SEDPATTERN | tail -r | tr '\n' '/')"
    else
        cd ..
    fi
}
set -o vi
alias ls="ls -G"
alias l="ls -G"
alias ll="ls -ltrG"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
