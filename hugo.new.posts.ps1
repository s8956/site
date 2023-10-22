# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

function Open-INIT() {
  New-Hugo
}

# -------------------------------------------------------------------------------------------------------------------- #
# HUGO: NEW CONTENT.
# -------------------------------------------------------------------------------------------------------------------- #

function New-Hugo() {
  $type = "posts"

  .\hugo.exe new "$($type)/$(_Get-Year)/$(_Get-Month)/$(_Get-Timestamp)_$(_Get-Random)"
  Read-Host -Prompt "Press ENTER or CTRL+C to EXIT..."
}

# -------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------< COMMON FUNCTIONS >------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------------- #

# Year.
function _Get-Year() {
  $year = (Get-Date -Format "yyyy")
  return $year
}

# Month.
function _Get-Month() {
  $month = (Get-Date -Format "MM")
  return $month
}

# Timestamp.
function _Get-Timestamp() {
  $timestamp = ([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())
  return $timestamp
}

# Random.
function _Get-Random() {
  $random = (Get-Random -Minimum 1000 -Maximum 9999)
  return $random
}

# -------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------< INIT FUNCTIONS >------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

Open-INIT
