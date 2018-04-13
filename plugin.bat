@echo off
type .vimrc > "%UserProfile%\.vimrc"
set vimDir="%UserProfile%\vimfiles"
if not exist %vimDir% mkdir %vimDir%
if not exist "%vimDir%\autoload" mkdir "%vimDir%\autoload"
if not exist "%vimDir%\autoload\pathogen.vim" (
        bitsadmin.exe /transfer "download pathogen.vim" https://tpo.pe/pathogen.vim "%vimDir%\autoload\pathogen.vim"
)
if not exist "%vimDir%\bundle" mkdir "%vimDir%\bundle"

for /f "delims=| tokens=1,2" %%G in (plugin-hub) do (
        set %%G=%%H 
        if not exist "%vimDir%\bundle\%%G" git clone %%H  "%vimDir%\bundle\%%G"
)
@pause
