@echo off

:: Configuration
set VERSION=1.3.3
set FILE=zstd-%VERSION%.zip
set DIR=zstd-%VERSION%
set URL=https://github.com/facebook/zstd/archive/v%VERSION%.zip
IF "%ARCH%"=="" set ARCH=x64

echo [0/4] Library(zstd==%VERSION%)

SET ORIGIN=%cd%
SET LOG_FILE=%ORIGIN%\install.log

:: Cleaning up previous mess
del /Q %FILE% ! >nul 2>&1
rd /S /Q %DIR% >nul 2>&1
del /Q %LOG_FILE% ! >nul 2>&1
copy /y nul %LOG_FILE% >nul 2>&1

echo|set /p="[1/4] Downloading... "
echo Fetching %URL% >>%LOG_FILE% 2>&1
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%FILE%')" >>%LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (echo FAILED. && type %LOG_FILE% && exit /B 1) else (echo done.)

echo|set /p="[2/4] Extracting... "
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%FILE%', '.'); }
if %ERRORLEVEL% NEQ 0 (echo FAILED. && type %LOG_FILE% && exit /B 1) else (echo done.)

cd %DIR%\build\cmake && mkdir build && cd build

echo|set /p="[3/4] Configuring... "
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_GENERATOR_PLATFORM=%ARCH% -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE -DCMAKE_INSTALL_PREFIX="%programfiles%\zstd" .. >>%LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (echo FAILED. && type %LOG_FILE% && exit /B 1) else (echo done.)

echo|set /p="[4/4] Compiling and installing... "
cmake --build . --config Release --target install >>%LOG_FILE% 2>&1
if %ERRORLEVEL% NEQ 0 (echo FAILED. && type %LOG_FILE% && exit /B 1) else (echo done.)

cd %ORIGIN% >nul 2>&1
del /Q %FILE% >nul 2>&1
rd /S /Q %DIR% >nul 2>&1

echo Details can be found at %LOG_FILE%.

@echo on
