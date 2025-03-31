#!/bin/bash

set -e

ccache --set-config sloppiness=pch_defines,time_macros

show_usage() {
  echo "Usage: $0 [arguments]"
  echo -e "\t- Compiles QGIS"
  echo -e "\t- Argument order does not matter"
  echo -e "\t- Valid arguments are:"
  echo -e "\t\t--help: shows this message and exits"
  echo -e "\t\t--release: sets build type as release, without this the build type is debug"
  echo -e "\t\t- any additional arguments are passed to CMake"
}

STARTDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export BUILD_TYPE="Debug"
pos_arguments=""

for var in "$@"; do
  if [ $var == "--help" ]; then
    show_usage
    exit 0
  fi

  if [ $var == "--release" ]; then
    export BUILD_TYPE="Release"
  fi

  if [ $var != --* ]; then
    pos_arguments="$pos_arguments $var"
  fi

done


if [ "$BUILD_TYPE" = "" ]; then
  export BUILD_TYPE="Debug"
fi

BUILDDIR="$STARTDIR/build_$BUILD_TYPE"

cmake . -G Ninja -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_EXPORT_COMPILE_COMMANDS=true -DCMAKE_BUILD_TYPE=$BUILD_TYPE $pos_arguments -B $BUILDDIR

if [ -f "$compile_commands_builddir" ]; then
  if [ -f "$compile_commands_repodir" ]; then
    if cmp -s $compile_commands_builddir $compile_commands_repodir; then
      commands_modified=0
    else
      commands_modified=1
    fi
  else
    commands_modified=1
  fi
fi

cmake --build $BUILDDIR
