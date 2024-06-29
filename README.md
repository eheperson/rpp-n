# RPP-N (Rec-Play-Pause Nano)

Template repository for cross-platform C++ development based on the CMake build system.

## Resources

> **Note:** This repository has been tested on macOS and Debian-based Linux distributions. Windows support will be added in the future.

### Who is this repository for?
- Projects based on the CMake build system.
- Projects that require the development of additional libraries that do not require any third-party dependencies, like `src/TestLib.h`.

### Requirements:
- CMake
- Git
- Compiler

## Preparing the Development Environment

### Clone the repository:
```bash
git clone git@github.com:eheperson/rpp-n.git
```

### Generate the build files using CMake (Release configuration):

For Windows:
```bash
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=out/app -S . -B out/build
```

For Unix/Linux:
```bash
cmake -DCMAKE_INSTALL_PREFIX=out/app -S . -B out/build
```

### Build the project (Release configuration will be used by default):
```bash
cmake --build out/build -j 12 -v
```

### Install the project (Release configuration will be used by default):
```bash
cmake --install out/build --verbose
```

### Package the project:
```bash
cpack out/build -c Debug --verbose
```

---

### TODOs
- Include compiler options in the CMake configuration.
- Update the `bake.sh` file to automate develop/build/test/clean process on Linux/Unix systems
- Implement the `bake.bat` file to automate develop/build/test/clean process on Windows systems
