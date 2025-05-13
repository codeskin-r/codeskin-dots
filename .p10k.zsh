# 🌑 .p10k.zsh — Material Minimal Hacker

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{245}▍%f "
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{81}▶%f "

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_icon
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
  battery
  time
)

# 🔮 Mensaje inferior sutil y minimal
prompt_minimalhack() {
  local msg='%F{245}"⌘ Hackea con elegancia..."%f'
  print -P "%{$(tput sc; tput cup $(($(tput lines)-1)) 0)%}$msg%{$(tput rc)%}"
}
add-zsh-hook precmd prompt_minimalhack

# 🎨 Colores Material Design suaves y planos
# Inspiración: https://material.io/design/color/the-color-system.html#tools-for-picking-colors

typeset -g POWERLEVEL9K_BACKGROUND=

# 🎭 Identidad visual minimal
typeset -g POWERLEVEL9K_CUSTOM_ICON='λ'
typeset -g POWERLEVEL9K_CUSTOM_ICON_FOREGROUND=81  # Indigo

# 👤 Usuario y host
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=245
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# 📁 Directorio
typeset -g POWERLEVEL9K_DIR_FOREGROUND=66  # Blue gray

# 🌿 Git/VCS
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
typeset -g POWERLEVEL9K_VCS_FOREGROUND=77
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=109
typeset -g POWERLEVEL9K_VCS_DIRTY_FOREGROUND=203
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=false
typeset -g POWERLEVEL9K_VCS_SHORTEN_LENGTH=1
typeset -g POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash)

# 🐍 Virtualenv
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=72
typeset -g POWERLEVEL9K_VIRTUALENV_PREFIX='venv '

# 🌐 Nodeenv
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
typeset -g POWERLEVEL9K_NODEENV_PREFIX='node '

# 🧠 RAM
typeset -g POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
typeset -g POWERLEVEL9K_RAM_FOREGROUND=110

# ✅ Status de comandos
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=108
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=203
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✖'

# ⏱️ Tiempo de ejecución
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=245
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

# 🕒 Hora
typeset -g POWERLEVEL9K_TIME_FOREGROUND=245
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

# 🔋 Batería
typeset -g POWERLEVEL9K_BATTERY_VERBOSE=true
typeset -g POWERLEVEL9K_BATTERY_FOREGROUND=102
typeset -g POWERLEVEL9K_BATTERY_BACKGROUND=
typeset -g POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=110
typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=70
typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=245
typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=203
typeset -g POWERLEVEL9K_BATTERY_ICON='🔋'

# ░ Separadores minimalistas
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=''

