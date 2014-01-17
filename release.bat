set MRL_ROOT=.

msbuild /t:Clean /p:Configuration=Debug %MRL_ROOT%\mrl.sln
msbuild /t:Clean /p:Configuration=Release %MRL_ROOT%\mrl.sln
msbuild /t:Build /p:Configuration=Debug %MRL_ROOT%\mrl.sln
msbuild /t:Build /p:Configuration=Release %MRL_ROOT%\mrl.sln

for /f %%i in (project_list.txt) do ^
xcopy /e /y /i /f %MRL_ROOT%\include\mrl ..\%%i\include\mrl & ^
xcopy /e /y /i /f %MRL_ROOT%\lib\Debug\*.lib ..\%%i\lib\Debug\ & ^
xcopy /e /y /i /f %MRL_ROOT%\bin\Debug\*.dll ..\%%i\bin\Debug\ & ^
xcopy /e /y /i /f %MRL_ROOT%\lib\Release\*.lib ..\%%i\lib\Release\ & ^
xcopy /e /y /i /f %MRL_ROOT%\bin\Release\*.dll ..\%%i\bin\Release\

pause