REM Automatically fills the bin dir with full Qt and compiler dependencies of the app exe (for Windows)
cd bin
%dev_qt_ver_bin%\windeployqt --release --qmldir ..\gui ExtColorsTestApp.exe
cd ..
