@echo off
title test build command
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC
set QTDIR=C:\Qt\Qt5.9.1\5.9.1\msvc2015_64
set PATH=%PATH%;%QTDIR%\bin
call "%VCINSTALLDIR%\vcvarsall.bat" amd64
nmake