# rpp-m (rec-play-pause-micro)
 template repository for cross-platform cpp development based on CMake build system Resources

> **NOTE :** This repository is tested only on MacOS and debian based Linux Distributions. Will be updated for Windows in the future.

### Who is this repository for?
* If project based on CMakeLists build system.
* If project contains only few source files like `main.cpp`, `mylib.cpp` etc.

### Requirements:
* cmake
* git


---

## Project Structure
### Zero Files/Dirs :
* **`main.cpp` file :** Your C++ file.
* **`rppmConfig.h.in` directory :** Configuration file of the project.


### Created Files/Dirs :
* **`app` directory :** Installation directory of the CMake
* **`build` directory :** Build output of the CMake 

## Preparing Development Environment
    ```
    # clone the repo
    git clone git@github.com:eheperson/rpp-m.git

    # change access rights of compile.sh file
    chmod +x compile.sh

    # run the compile.sh to start CMake build process
    ./compile.sh
    ```

---

## Adding more .cpp files :

In the `CMakeLists.txt` there are an example of adding a new executable file.
As a first step, create an executable like `temp.cpp`.

```
# Step 1 : adding executable (CMakeLists.txt line:29)
add_executable(temp temp.cpp)

# Step 2 : adding binary tree to the search path (CMakeLists.txt line:35)
# if you will not use rppmConfig.h in your executable, this step is unnecessary.
target_include_directories(temp PUBLIC "${PROJECT_BINARY_DIR}") 

# Step 3 : install the executable (CMakeLists.txt line:41)
install(TARGETS temp DESTINATION bin)
```
