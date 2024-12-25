setlocal
call %~dp0..\vc_setup.cmd
set BUILD=build
title Configuring blend2d
%CMAKE% -S . -B %BUILD%
call :do_build Debug
call :do_build RelWithDebInfo
title Done building blend2d
PdbIndexer %DEPS_SOURCE_URL%/blend2d
NuGet.exe pack blend2d.nuspec -OutputDirectory %PACKAGES%\nuget_packages
endlocal

goto:eof

:do_build
  title Building blend2d %1
  msbuild /m %BUILD%\blend2d.sln -p:Configuration=%1
  goto:eof
