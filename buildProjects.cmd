call buildproject.cmd Xpand.ToolboxCreator ".\ToolBoxCreator\Xpand.ToolboxCreator.csproj"
echo FixReferences
%msbuild% /nologo /t:FixReferences /verbosity:quiet /p:Configuration=%configuration% Xpand.build
echo Building helper libraries...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Xpand\Helpers.sln"
echo Building core modules...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Xpand\Xpand.ExpressApp\Xpand.ExpressApp.sln"
echo Building all other modules...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Xpand\Xpand.ExpressApp.Modules\AllModules.sln"

echo Installing assemblies to GAC...
xcopy "_third_party_assemblies\GACInstaller.exe" ".\Xpand.DLL\GacInstaller.exe" /S /Y /H /I
call Xpand.DLL\GACInstaller.exe 

echo Installing Toolbox Items...
call ".\Xpand.DLL\Xpand.ToolBoxCreator.exe"

echo Building Demo Projects...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Demos\AllDemos.sln"

echo Building Module Tester Projects...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Demos\Modules\AllModuleTesters.sln"

echo Building Xpand.ExpressApp.ModelEditor...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Xpand.Addins\Xpand.ExpressApp.ModelEditor\Xpand.ExpressApp.ModelEditor.csproj"
echo Done Building Xpand.ExpressApp.ModelEditor
echo Building XpandAddIns...
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\Xpand.Addins\XpandAddIns.csproj"
echo Done Building XpandAddIns

