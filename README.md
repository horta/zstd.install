# zstd.install

[![AppVeyor](https://img.shields.io/appveyor/ci/Horta/zstd-install.svg?style=flat-square&label=windows%20build)](https://ci.appveyor.com/project/Horta/zstd-install) [![Travis branch](https://img.shields.io/travis/horta/zstd.install/master.svg?style=flat-square&label=linux%20%2F%20macos%20build)](https://travis-ci.org/horta/zstd.install)

Windows, macOS, and Linux one-line installers for zstandard library.

# Usage

For Windows

```
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/horta/zstd.install/master/install.bat', 'install.bat')" && install.bat
```

For Linux and macOS

```
bash <(curl -fsSL https://raw.githubusercontent.com/horta/zstd.install/master/install)
```
