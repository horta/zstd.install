# zstd.install

Windows, macOS, and Linux one-line installers for zstandard library.

# Usage

For Windows

```
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/horta/zstd.install/main/install.bat', 'install.bat')" && install.bat
```

For Linux and macOS

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/horta/zstd.install/main/install)"
```
