# 🌙 .p10k.zsh estilo Tokyonight Moon Hacker

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{240}%f "
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{110}%f "

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_moonhack
  context
  dir
  vcs
  virtualenv
  nodeenv
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  command_execution_time
  ram
  time
)

prompt_tokyohack() {
  local msg='%F{61}"🌓 En lo profundo del terminal, la noche murmura comandos..."%f'
  print -P "%{$(tput sc; tput cup $(($(tput lines)-1)) 0)%}$msg%{$(tput rc)%}"
}
add-zsh-hook precmd prompt_tokyohack

# 🎨 Colores inspirados en Tokyonight Moon
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_moon.yaml

typeset -g POWERLEVEL9K_BACKGROUND=

typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=109  # Cian suave
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

typeset -g POWERLEVEL9K_DIR_FOREGROUND=110  # Azul pastel

typeset -g POWERLEVEL9K_CUSTOM_MOONHACK='🌙'
typeset -g POWERLEVEL9K_CUSTOM_MOONHACK_FOREGROUND=141  # Magenta eléctrico

typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=149  # Azul claro
typeset -g POWERLEVEL9K_VIRTUALENV_PREFIX=' '

typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=81  # Verde neón azulado
typeset -g POWERLEVEL9K_NODEENV_PREFIX=' '

typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
typeset -g POWERLEVEL9K_VCS_FOREGROUND=117  # Azul vibrante
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=109
typeset -g POWERLEVEL9K_VCS_DIRTY_FOREGROUND=204  # Rosado fuerte
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=false
typeset -g POWERLEVEL9K_VCS_SHORTEN_LENGTH=2
typeset -g POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash)

typeset -g POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
typeset -g POWERLEVEL9K_RAM_FOREGROUND=141  # Magenta

typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=110
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=204
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✖'

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=109
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

typeset -g POWERLEVEL9K_TIME_FOREGROUND=110
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=''

