@echo off
REM 当前盘符：			%~d0
REM 当前路径：			%cd%
REM 当前执行命令行：	%0
REM 当前bat文件路径：	%~dp0
REM 当前bat文件短路径：	%~sdp0
if "%VS140COMNTOOLS%" == "" (
  REM 2017 150
  REM 2015 140
  REM 2013 120
  
  msg "%username%" "Visual Studio 2015 not detected"
  exit 1
)

if not exist %~dp0..\build (
    echo Create Directory: %~dp0..\build
    md %~dp0..\build
) else (
   REM donothing , just show the grammar of if-else
)
echo Entering %~dp0..\build
cd %~dp0..\build
echo Star Building...
cmake ../src/ -G "Visual Studio 14 2015 Win64"
echo Build Over...

@echo on