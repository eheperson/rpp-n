# RPP-N (Rec-Play-Pause Nano)
 Template repository for cross-platform cpp development based on CMake build system Resources

> **NOTE :** This repository is tested only on MacOS and debian based Linux Distributions. Will be updated for Windows in the future.

### Who is this repository for?
* If project based on CMakeLists build system.
* If project contains only few source files like `main.cpp`, `mylib.cpp` etc.
* If project requires develop extra libraries does not requires any 3Rd dependencies like `TestLib.h`.
* If you need a C++ development laboratuary to test simple libraries does not requires any 3Rd dependencies.

### Requirements:
* Cmake
* Make (optional)
* Git
* GNU Compiler Collection (gcc, g++ etc.)

### Extras : 
* `License.txt`, you can license your software by editing this file.

---

## Project Structure
### Zero Files/Dirs :
* **`main.cpp` file :** Your C++ file.
* **`rppnConfig.h.in` file :** Configuration file of the project.
* **`bake.sh` file :**  Baker file for tests.
* **`modules` directory :**  Contains your extra modules

### Created Files/Dirs :
* **`out/app` directory :** Installation directory of the CMake
* **`out/build` directory :** Build output of the CMake 
* **`out/package` directory :** Package output of the CMake 

## Preparing Development Environment
```
    # clone the repo
    git clone git@github.com:eheperson/rpp-n.git

    # change access rights of compile.sh file
    chmod +x bake.sh
```

---

## Development

* Use the `bake.sh` file for developement. 
* Purpose of the `bake.sh` file is handling all *build*, *install* and *packing* procedures in isolated directory named as `out/`.
* `CMAKE_INSTALL_PREFIX` option is modified to install targets in `/out` directory.

### Steps

1. Write your code.
2. Edit the `CMakeLists.txt` file for proper linking, compiling and installing.
3. Run the `bake.sh` file.

---

## Production

* After your development is done, you can follow the steps below to build and pack your application.

### 1. Configure : 

```
    cmake -S . -B ./out/build
```

### 2. Build : 

```
    # option 1 : building by cmake
    cd ./out/build && cmake --build . -v 

    # option 2 : building by make itself 
    # ( there is no any major difference between option1 and option 2)
    cd ./out/build && make 

    # alternatively you can use -j parameters with make command to speed up build process
    cd ./out/build && make -j7
```

### 3. Install : 

The project will configured to install common unix install directories like : `usr/slare/local`, `/usr/local` etc.

> you may require run install commands by `sudo`, because installing process will install your project to the one of the root directories.

```
    # option 1 :
    cd ./out/build && cmake --install .

    # option 2 : 
    cd ./out/build && make install
```

### 4. Packing : 

```
    cd ./out/build && cpack -C Release
```

## Adding more .cpp files :

In the `'CMakeLists.txt'` there are an example of adding a new executable file.
As a first step, create an executable like `'temp.cpp'`.

```
# Step 1 : adding executable (CMakeLists.txt line:56)
add_executable(temp temp.cpp)

# Step 2 : adding binary tree to the search path (CMakeLists.txt line:60)
# if you will not use rppnConfig.h in your executable, this step is unnecessary.
target_include_directories(temp PUBLIC "${PROJECT_BINARY_DIR}") 

# Step 3 : linking new executable with our modules (CMakeLists.txt line:75, line:76, line:77)
target_include_directories(temp PUBLIC ${EXTRA_INCLUDE_DIRS}) 
target_link_directories(temp PUBLIC ${EXTRA_LIB_DIRS})
target_link_libraries(temp PUBLIC ${EXTRA_LINKS})

# Step 4 : install the executable (CMakeLists.txt line:82)
install(TARGETS temp DESTINATION bin)
```

> Optionally, you can add new executable as a dependency of main.cpp like : 
> ```
> add_executable(${CMAKE_PROJECT_NAME} main.cpp temp.cpp)   
> ```
---

## Adding more modules :

Yo do not have to make any changes in `'./CMakeLists.txt'` file. go to the `'/modules'` directory and create new folder with your new module name first.


To the purpose of maintainibly, test module renamed as `'${MODULE_1}'` in the `'modules/CMakeLists.txt'` file. If you want to add new module easily: 

* **Step 1 :** just use the existing lines on `'modules/CMakeLists.txt'`  by copy and paste, change the required fields then : 
```
    option(USE_MODULE_2 "Build module 2" ON)
    #
    if(USE_MODULE_2)
        # To make use  of the new library we will add an add_subdirectory() call
        # add_subdirectory(${MODULE_2})
        message(STATUS "Module 2 Found")
        add_definitions(-DUSE_MODULE_2)
        #
        set(MODULE_2 MyNewModule)
        set(EXECUTABLE_FILE_2 MyNewModule/myNewExecutable.cxx)
        #
        add_library(${MODULE_2} ${EXECUTABLE_FILE_2})
        #
        # append in local scope
        list(APPEND EXTRA_INCLUDE_DIRS "${MODULES_DIR}/${MODULE_2}")
        list(APPEND EXTRA_LIB_DIRS "${MODULE_2}")
        list(APPEND EXTRA_LINKS ${MODULE_2})
        # set in parent scope
        set(EXTRA_INCLUDE_DIRS "${EXTRA_INCLUDE_DIRS}" PARENT_SCOPE)
        set(EXTRA_LIB_DIRS "${EXTRA_LIB_DIRS}" PARENT_SCOPE)
        set(EXTRA_LINKS "${EXTRA_LINKS}" PARENT_SCOPE)
        #
        install(TARGETS ${MODULE_2} DESTINATION lib)
        install(FILES ${MODULES_DIR}/${MODULE_2}/${MODULE_2}.h DESTINATION include)
    endif()
```



* **Step 3 :** be sure your new module structure looks like : 
``` 
    \MyNewModule
        MyNewModule.h
        myNewExecutable.cxx
```

## Extra Info:

* If your new module has more than 1 executables, you can link them like below,  Cmake will interpred them as dependencies.: 
```
    add_library(${MODULE_2} ${EXECUTABLE_FILE_2} {EXECUTABLE_FILE_4} {EXECUTABLE_FILE_5} ... )
```

* If your multiple files does not dependent, you can use this approach and you can import it then : 
```
    add_library(other_module other_executable.cpp)
    target_include_directories(other_module PUBLIC ${EXTRA_INCLUDE_DIRS}) 
    target_link_directories(other_module PUBLIC ${EXTRA_LIB_DIRS})
    target_link_libraries(other_module PUBLIC ${EXTRA_LINKS})
    install(TARGETS other_executable DESTINATION lib)
```

* You can add more than 1 header files also, just follow same steps and do not forget add new installation rule to the : 
    ```
        install(FILES ${MODULES_DIR}/${MODULE_2}/${MODULE_3}.h DESTINATION include)
    ```



