@echo off
set "exe=hugo"
set "cacheDir=cache"
start "" "%~dp0\%exe%.exe" server -D --printI18nWarnings --cacheDir "%~dp0\%cacheDir%" --gc
exit
