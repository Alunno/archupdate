# Integração com o shell
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"

#Exportações
export _ZO_ECHO='0'
export EDITOR="vim"
export SUDO_EDITOR="$EDITOR"
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit-git"
export PATH="$PATH:$HOME/gon/bin"
export PATH="$PATH:/opt/kafka/bin"
export STARSHIP_CONFIG=~/.config/starship.toml
export EDITOR=/bin/vim
export PATH=$PATH:/usr/local/go/bin
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light romkatv/gitstatus

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::terraform

autoload -Uz compinit && compinit
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000

setopt EXTENDED_HISTORY HIST_VERIFY HIST_REDUCE_BLANKS HIST_IGNORE_ALL_DUPS

bindkey -e
zstyle :compinstall filename '${HOME}.zshrc'

autoload -Uz compinit
compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#Auto-completar com tab
setopt auto_list
setopt auto_menu
setopt case_glob

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
