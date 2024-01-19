<#PSScriptInfo
  .VERSION      0.1.0
  .GUID         efe4b366-f480-4c24-b5ac-4c0ac8073ecb
  .AUTHOR       Kai Kimera
  .AUTHOREMAIL  mail@kai.kim
  .COMPANYNAME  Library Online
  .COPYRIGHT    2023 Library Online. All rights reserved.
  .LICENSEURI   https://choosealicense.com/licenses/mit/
  .PROJECTURI   https://lib.onl/
#>

#Requires -Version 7.2

<#
  .SYNOPSIS
  Starting the Hugo server.

  .DESCRIPTION
  The script starts the Hugo server with specific parameters.
#>

Param(
  [Alias('P')][int]$P_Port = 1313
)

# -------------------------------------------------------------------------------------------------------------------- #
# INITIALIZATION.
# -------------------------------------------------------------------------------------------------------------------- #

function Start-Script() {
  Start-HugoServer
}

# -------------------------------------------------------------------------------------------------------------------- #
# HUGO: START SERVER.
# -------------------------------------------------------------------------------------------------------------------- #

function Start-HugoServer() {
  .\hugo.exe server `
    --port $P_Port `
    --buildDrafts `
    --printI18nWarnings `
    --cacheDir "${PSScriptRoot}\cache" `
    --gc
}

# -------------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------< RUNNING SCRIPT >------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------------- #

Start-Script
