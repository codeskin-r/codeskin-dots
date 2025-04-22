
# ⚠️ ARCHIVO .p10k.zsh estilo Grimorio Hacker
# Tema oscuro, sin fondo, con verdes fluorescentes y magentas eléctricos

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{240}⮑%f "
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{46}⤷%f "

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_hacknode
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

prompt_grimorio() {
  local msg='%F{237}"Desde las sombras, comando tras comando, el sistema revela sus secretos..."%f'
  print -P "%{$(tput sc; tput cup $(($(tput lines)-1)) 0)%}$msg%{$(tput rc)%}"
}
add-zsh-hook precmd prompt_grimorio

typeset -g POWERLEVEL9K_BACKGROUND=

typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=82
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

typeset -g POWERLEVEL9K_DIR_FOREGROUND=48

typeset -g POWERLEVEL9K_CUSTOM_HACKNODE='🧬'
typeset -g POWERLEVEL9K_CUSTOM_HACKNODE_FOREGROUND=40

typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=48
typeset -g POWERLEVEL9K_VIRTUALENV_PREFIX='🐍 '

typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=10
typeset -g POWERLEVEL9K_NODEENV_PREFIX='🟢 '

typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
typeset -g POWERLEVEL9K_VCS_FOREGROUND=46
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=244
typeset -g POWERLEVEL9K_VCS_DIRTY_FOREGROUND=160
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=false
typeset -g POWERLEVEL9K_VCS_SHORTEN_LENGTH=2
typeset -g POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash)

typeset -g POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
typeset -g POWERLEVEL9K_RAM_FOREGROUND=201

typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=46
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✖'

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=82
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

typeset -g POWERLEVEL9K_TIME_FOREGROUND=201
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=''


