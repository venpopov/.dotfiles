#!/bin/sh
source "${ZDOTDIR:-${HOME}/.config/zsh}"/functions.zsh

HISTSIZE=1000000
SAVEHIST=1000000
export LC_ALL=en_US.UTF-8

export DEV_DIR=$HOME/GitHub
add_to_path $HOME/bin
add_to_path $HOME/.local/bin
add_to_path $HOME/.juliaup/bin
add_to_path $HOME/.cargo/bin
[[ ! -r '$HOME/.opam/opam-init/init.zsh' ]] || source '$HOME/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# Deal with different platform settings
case "$(uname -s)" in
  Darwin)
    export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    ;;

  Linux)
    ;;

  CYGWIN* | MINGW32* | MSYS* | MINGW*)
    ;;

  *)
    ;;
esac


