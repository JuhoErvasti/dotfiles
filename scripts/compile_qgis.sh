#!/bin/bash

#example: ./compile_qgis.sh --debug -DBUILD_WITH_QT6=ON -DWITH_QTWEBKIT=OFF -DWITH_QTWEBENGINE=ON

set -e

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

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

pos_arguments=""

for var in "$@"; do
  if [ $var == "--help" ]; then
    show_usage
    exit 0
  fi

  if [ $var == "--release" ]; then
    export BUILD_TYPE="Release"
    continue
  fi

  if [ $var == "--debug" ]; then
    export BUILD_TYPE="Debug"
    continue
  fi

  if [ $var != --* ]; then
    pos_arguments="$pos_arguments $var"
  fi

done

if [ "$BUILD_TYPE" = "" ]; then
  echo "Build type must be selected"
  show_usage
  exit 1
fi


BUILDDIR="$STARTDIR/build_$BUILD_TYPE"

cmake . -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=true -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DBUILD_WITH_QT6=ON -DWITH_QTWEBKIT=OFF -DWITH_QTWEBENGINE=ON -B $BUILDDIR

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

cmake --build $BUILDDIR --parallel 6
