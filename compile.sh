#!/bin/bash
rootDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

buildDIR="${rootDir}/build"
installDIR="${rootDir}/app"

# delete and re-create build directory at every time
if [ ! -d ${buildDIR} ]; then
  mkdir ${buildDIR}
else
  rm -r ${buildDIR}
  mkdir ${buildDIR}
fi

# delete and re-create install directory at every time
if [ ! -d ${installDIR} ]; then
  mkdir ${installDIR}
else
  rm -r ${installDIR}
  mkdir ${installDIR}
fi

# # create build dir if dows not exists
# if [ ! -d ${buildDIR} ]; then
#   mkdir ${buildDIR}
# fi

# # create install dir if dows not exists
# if [ ! -d ${installDIR} ]; then
#   mkdir ${installDIR}
# fi

# -----------------------------------
#       CONFIGURE
# -----------------------------------
echo "" && echo " Configure Begin" && echo ""

# cmake -G "MinGW Makefiles" -DUSE_EXAMPLELIB=ON -S . -B ./build
cmake -S . -B ./build

echo "" && echo " Configure End" && echo ""

# -----------------------------------
#       BUILD
# -----------------------------------
echo "" && echo " Build Begin" && echo ""

cd build && cmake --build . -v && cd ..
# or 
# cd build && mingw32-make . -v && cd ..

echo "" && echo " Build End" && echo ""

# -----------------------------------
#       INSTALL
# -----------------------------------
echo "" && echo " Install Begin" && echo ""
#
cd ${buildDIR} && cmake --install . --prefix ${installDIR} && cd ${rootDir}
#
echo "" && echo " Install End " && echo ""

