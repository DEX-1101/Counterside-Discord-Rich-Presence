::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHqL4UwkLQlnRQCHfFmKJYkJ5ub64u+DnXJMa90AKbDk5eWxH/U12HrtdpkjmHNZl6s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZkoaHUrRXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlXMbSXpZg==
::ZQ05rAF9IAHYFVzEqQITJw5aWAGQZlizArBczOHo7OWVpg0vXeE3OL/J36eLLuMWqmD8YZMjxXNVlqs=
::eg0/rx1wNQPfEVWB+kM9LVsJDCeNKWWuA6cv4ez+pKSCukh9
::fBEirQZwNQPfEVWB+kM9LVsJDCeNKWWuA6dG2+H/6qqjq14eW/A7OL3S2bzOEPIW+UDqdpNN
::cRolqwZ3JBvQF1fEqQITJw5aWAGQZlizArBczOHo7OWVpg0vXeE3OL/J36eLLuMWig==
::dhA7uBVwLU+EWEHVpRJhSA==
::YQ03rBFzNR3SWATE7BNheEo0
::dhAmsQZ3MwfNWATE7BNheEo0
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmn+1c+PB5GFjeLOG76IrwP6+fp66q1q04VFNItfZze1LeLQA==
::Zh4grVQjdCuDJHqL4UwkLQlnRQCHfFmKJYk/5/31+++VkUQZUalxfZfeug==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized

mode con:cols=80 lines=10
color f0
title RPC Logging
SETLOCAL EnableExtensions
:: ================================================

REM ===========RUNNING PROCCES=============
echo [1101] Checking Discord . . .
timeout 1 >NUL
set EXE=Discord.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto ProcessFound
goto ProcessNotFound
:ProcessFound
echo %EXE% is running
echo.
goto NEXT
:ProcessNotFound
color fc
echo WARNING : %EXE% is not running
echo.
goto ERROR
REM ===========END=============


:NEXT
echo [1101] Checking Node.js . . .
where node.exe >nul 2>&1 && echo Node.js is installed. || echo Node.js not installed.
node -v
echo.

echo [1101] Running RPC . . .

start rpc.exe
start /WAIT CounterSide.exe

taskkill /F /IM rpc.exe
taskkill /F /IM node.exe


echo Exiting RPC . . .
EXIT

:ERROR
echo Make sure Discord is opened and running normally.
pause


EXIT


