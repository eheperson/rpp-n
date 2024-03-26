# RPP-N (Rec-Play-Pause Nano)
 Template repository for cross-platform cpp development based on CMake build system Resources

> **NOTE :** This repository is tested only on MacOS and debian based Linux Distributions. Will be updated for Windows in the future.

### Who is this repository for?
* If project based on CMakeLists build system.
* If project requires develop extra libraries does not requires any 3Rd dependencies like `src/TestLib.h`.

### Requirements:
* Cmake
* Git
* compiler xd

## Preparing Development Environment
```
# clone the repo
git clone git@github.com:eheperson/rpp-n.git

```

Generate the build files using CMake for Release configuration:
```bash
# Windows
cmake -G "MinGW Makefiles" -DUSE_TESTLIB=ON -DCMAKE_INSTALL_PREFIX=out/app -S . -B out//build

# Unix/Linux
cmake -DUSE_TESTLIB=ON -DCMAKE_INSTALL_PREFIX=out/app -S . -B out//build

```

Build the project (Release configuration will be used by default)
```bash
cmake  --build .//out//build -j 12 -v
```

Install the project (Release configuration will be used by default)
```bash
cmake --install .//out//build  --verbose
```


Package the project
```bash
cpack .\out\build  -c Debug --verbose
```

--- 

### TODOs
- inlcude compiler options to the cmake