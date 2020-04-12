@echo OFF
set NULL_VAL=null
set NODE_VER=%NULL_VAL%
set NODE_EXEC=node-v10.15.3-x86.msi

node -v >.tmp_nodever
set /p NODE_VER=<.tmp_nodever
del .tmp_nodever

IF "%NODE_VER%"=="%NULL_VAL%" (
	echo.
	echo Node.js is not installed! Please press a key to download and install it from the website that will open.
	PAUSE
	start "" http://nodejs.org/dist/v10.15.3/%NODE_EXEC%
	echo.
	echo.
	echo After you have installed Node.js, press a key to shut down this process. Please restart it again afterwards.
	PAUSE
	EXIT
) ELSE (
	echo A version of Node.js ^(%NODE_VER%^) is installed. Proceeding...
)
cd ../..
echo INSTALLING JSDoc ...
call npm install -g jsdoc
IF %ERRORLEVEL% NEQ 0 Echo An error was found
IF %ERRORLEVEL% EQU 0 Echo No error found
echo DONE!
echo After you have installed the dependencies, press a key to shut down this process. Please restart it again afterwards.
pause