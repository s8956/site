#!/usr/bin/bash -e
#
# Creating new content for Hugo.
#
# @package    Bash
# @author     Kai Kimera <mail@kai.kim>
# @copyright  2023 Library Online
# @license    MIT
# @version    0.1.0
# @link       https://lib.onl/
# -------------------------------------------------------------------------------------------------------------------- #

(( EUID == 0 )) && { echo >&2 'This script should not be run as root!'; exit 1; }

# -------------------------------------------------------------------------------------------------------------------- #
# CONFIGURATION.
# -------------------------------------------------------------------------------------------------------------------- #

type="${1:-'articles'}"
date="$( command -v date )"
shuf="$( command -v shuf )"
hugo="$( command -v hugo )"

# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

init() {
  hugo_post
}

# -------------------------------------------------------------------------------------------------------------------- #
# HUGO: NEW CONTENT.
# -------------------------------------------------------------------------------------------------------------------- #

hugo_post() {
  ${hugo} new content "${type}/$( _year )/$( _month )/$( _timestamp )_$(_random)"
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
  echo "$(( $( ${date} -u '+%s%N' ) / 1000000 ))"
}

# Random.
_random() {
  ${shuf} -i '1000-9999' -n 1 --random-source='/dev/random'
}

# -------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------< RUNNING SCRIPT >------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

init "$@"; exit 0
