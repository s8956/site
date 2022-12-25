#!/usr/bin/bash -e

(( EUID == 0 )) && { echo >&2 "This script should not be run as root!"; exit 1; }

# -------------------------------------------------------------------------------------------------------------------- #
# CONFIGURATION.
# -------------------------------------------------------------------------------------------------------------------- #

cut="$( command -v cut )"
date="$( command -v date )"
shuf="$( command -v shuf )"
hugo="$( command -v hugo )"

# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

init() {
  hugo_new
}

# -------------------------------------------------------------------------------------------------------------------- #
# HUGO: NEW CONTENT.
# -------------------------------------------------------------------------------------------------------------------- #

hugo_new() {
  local type="posts"
  ${hugo} new "${type}/$( _year )/$( _month )/$( _timestamp )_$( _random )"
}

# -------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------< COMMON FUNCTIONS >------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------------- #

# Year.
_year() {
  ${date} -u '+%Y'
}

# Month.
_month() {
  ${date} -u '+%m'
}

# Timestamp.
_timestamp() {
  ${date} -u '+%s%N' | ${cut} -b1-13
}

# Random.
_random() {
  ${shuf} -i 100000-999999 -n 1 --random-source=/dev/random
}

# -------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------< INIT FUNCTIONS >------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

init "$@"; exit 0
