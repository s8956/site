<#PSScriptInfo
  .VERSION      0.1.0
  .GUID         ce5647fc-1e70-4205-be4e-57586095eedf
  .AUTHOR       Kitsune Solar
  .AUTHOREMAIL  mail@kitsune.solar
  .COMPANYNAME  Library Online
  .COPYRIGHT    2023 Library Online. All rights reserved.
  .LICENSEURI   https://choosealicense.com/licenses/mit/
  .PROJECTURI   https://lib.onl/
#>

#Requires -Version 7.2

<#
  .SYNOPSIS
  Creating new content for Hugo.

  .DESCRIPTION
  The script allows you to create new content for Hugo.
#>

# -------------------------------------------------------------------------------------------------------------------- #
# CONFIGURATION.
# -------------------------------------------------------------------------------------------------------------------- #

Param(
  [ValidateSet('articles', 'faq', 'resources')]
  [Alias('T')][string]$P_Type = 'articles'
)

# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

function Start-Script() {
  Start-HugoPost
}

# -------------------------------------------------------------------------------------------------------------------- #
# HUGO: NEW CONTENT.
# -------------------------------------------------------------------------------------------------------------------- #

function Start-HugoPost() {
  $Path = "$(Get-HugoYear)/$(Get-HugoMonth)/$(Get-HugoTimestamp)_$(Get-HugoRandom)"
  .\hugo.exe new content -k "${P_Type}" "${P_Type}/${Path}"
}

# -------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------< COMMON FUNCTIONS >------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------------- #

# Year.
function Get-HugoYear() {
  $year = "$(Get-Date -Format 'yyyy')"
  return $year
}

# Month.
function Get-HugoMonth() {
  $month = "$(Get-Date -Format 'MM')"
  return $month
}

# Timestamp.
function Get-HugoTimestamp() {
  $timestamp = "$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())"
  return $timestamp
}

# Random.
function Get-HugoRandom() {
  $random = "$(Get-Random -Minimum 1000 -Maximum 9999)"
  return $random
}

# -------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------< RUNNING SCRIPT >------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

Start-Script
