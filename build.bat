@echo off 
:: Renaming arguments
set file_name=%1%
set file_path=%2% 

:: Kludgy, but it works
if EXIST "c:\Program Files\Adobe\Adobe After Effects CS5" set version=CS5
if EXIST "c:\Program Files\Adobe\Adobe After Effects CS6" set version=CS6
if EXIST "c:\Program Files\Adobe\Adobe After Effects CC 2014" set version=CC 2014
if EXIST "c:\Program Files\Adobe\Adobe After Effects CC 2015" set version=CC 2015
::for future versions, as long as adobe don't change their naming system
if EXIST "c:\Program Files\Adobe\Adobe After Effects CC 2016" set version=CC 2016
if EXIST "c:\Program Files\Adobe\Adobe After Effects CC 2017" set version=CC 2017

:: Adobe After Effects folder location
set base_path=c:\Program Files\Adobe
set ae_folder_path=%base_path%\Adobe After Effects %version%
set ae_scripts_folder_path=%ae_folder_path%\Support Files\Scripts
::echo %ae_scripts_folder_path%

cd "%file_path%"

:: Copying script to Scripts folder
copy "%file_name%" "%ae_scripts_folder_path%\%file_name%"

cd "%ae_folder_path%\Support Files"

:: Running script in After Effects
AfterFX -r "%ae_scripts_folder_path%\%file_name%"

:: Printing happy feedback in the console
echo "Successfully compiled %file_name% to %full_path%\%file_name%";
