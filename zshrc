# Criar historico de comandos
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt EXTENDED_HISTORY HIST_VERIFY HIST_REDUCE_BLANKS HIST_IGNORE_ALL_DUPS

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/edison/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins adicionados
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Arquivo do autocompletar.
 zstyle :compinstall filename '${HOME}/.zshrc'

# Auto-completando com <TAB>
 setopt auto_list
 setopt auto_menu
 setopt case_glob
 setopt list_types
 setopt glob_complete
 setopt menu_complete
 setopt complete_in_word
 setopt complete_aliases
 autoload -U compinit promptinit
 compinit
 promptinit

 # Ativando modo 'verbose':
 zstyle ':completion:*' verbose 'yes'
 zstyle ':completion:*' show-completer

 # Lista colorida de complementações:
 zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

 # Menu de seleção visual:
 zstyle ':completion:*' menu select=3 _complete _ignored _approximate
 zstyle ':completion:*' select-prompt '%S zsh: Seleção atual = %p %s'

 # Auto descrição das complementações possíveis:
 zstyle ':completion:*:options' description 'yes'
 zstyle ':completion:*:options' auto-description '%d'

 # Formato das mensagens de auto-complementação:
 zstyle ':completion:*:corrections' format '%Bzsh: %d (erros: %e)%b'
 zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
 zstyle ':completion:*:warnings' format '%Bzsh: Inválido como: %d%b'

 # Listando auto-complementações em grupos:
 zstyle ':completion:*:matches' groups 'yes'
 zstyle ':completion:*' list-grouped
 zstyle ':completion:*' group-name ''
 zstyle ':completion:*:*:-command-:*' group-order commands builtins

 # Expandir o máximo que puder:
 zstyle ':completion:incremental:*' completer _complete _correct
 zstyle ':completion:*' completer _complete _correct _match _approximate
 zstyle ':completion:*:expand:*' tag-order all-expansions

 # Número de erros a aceitar durante auto-complementação:
 zstyle ':completion:*:approximate:*' max-errors 2 numeric

 # Usar '/d/s <TAB>' para expandir para '/dir/subdir':
 zstyle ':completion:*' expand 'yes'
 zstyle ':completion:*' squeeze-slashes 'yes'

 # Preservar prefixo/sufixo durante auto-complementação:
 zstyle ':completion:*' expand prefix suffix
 zstyle ':completion:*' completer _complete _prefix _match _approximate
 zstyle ':completion:*' preserve-prefix '//[^ /]##/'
 zstyle ':completion:*:match:*' original only
 
 # Evitar entradas duplicadas para os comandos abaixo:
 zstyle ':completion:*:rm:*' ignore-line 'yes'
 zstyle ':completion:*:cp:*' ignore-line 'yes'
 zstyle ':completion:*:mv:*' ignore-line 'yes'
 zstyle ':completion:*:ls:*' ignore-line 'yes'

 # Auto-complementação case-sensitive:
 zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

 # Auto-complementar a partir de curingas:
 zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'

 # Ignorar auto-complementação de funções internas do zsh:
 zstyle ':completion:*:functions' ignored-patterns '_*'

 # Autocompletar PID (kill).
 zstyle ':completion:*:*:kill:*' menu yes select
 zstyle ':completion:*:kill:*' force-list always
 
 # Alias
 alias aur='yay -Syu'
 alias pacman='sudo pacman -Syu'

eval "$(starship init zsh)"
