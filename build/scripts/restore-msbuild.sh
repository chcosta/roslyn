#!/usr/bin/env bash

ROSLYN_TOOLSET_PATH=$1
NUGET_EXE=$2
DOTNET_PATH=$ROSLYN_TOOLSET_PATH/../dotnet-cli/dotnet
MSBUILD_DOTNET_PATH=$ROSLYN_TOOLSET_PATH/../msbuild-dotnet-cli/dotnet

# Workaround, see https://github.com/dotnet/roslyn/issues/10210
export HOME=$(cd ~ && pwd)

echo "Restoring toolset packages"

$DOTNET_PATH restore -v Minimal --disable-parallel $(pwd)/build/ToolsetPackages/project.json

echo "Restore CrossPlatform.sln"
echo $ROSLYN_TOOLSET_PATH/corerun $ROSLYN_TOOLSET_PATH/RoslynRestore.dll $(pwd)/CrossPlatform.sln $NUGET_EXE $DOTNET_PATH
$ROSLYN_TOOLSET_PATH/corerun $ROSLYN_TOOLSET_PATH/RoslynRestore.dll $(pwd)/CrossPlatform.sln $NUGET_EXE $DOTNET_PATH
