# rpp-m (rec-play-pause-nano)
 template repository for cross-platform cpp development based on CMake build system Resources

> **NOTE :** This repository is tested only on MacOS and debian based Linux Distributions. Will be updated for Windows in the future.

### Who is this repository for?
* If project based on CMakeLists build system.
* If project requires developing some extra libs without 3rd dependencies.

### Requirements:
* cmake
* git

---

## Project Structure
### Zero Files/Dirs :
* **`main.cpp` file :** Your C++ file.
* **`rppnConfig.h.in` file :** Configuration file of the project.
* **`module` directory :**  Contains your extra modules

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

In the `'CMakeLists.txt'` there are an example of adding a new executable file.
As a first step, create an executable like `'temp.cpp'`.

```
# Step 1 : adding executable (CMakeLists.txt line:29)
add_executable(temp temp.cpp)

# Step 2 : adding binary tree to the search path (CMakeLists.txt line:35)
# if you will not use rppnConfig.h in your executable, this step is unnecessary.
target_include_directories(temp PUBLIC "${PROJECT_BINARY_DIR}") 

# Example to adding modules path to search path for new executable (CMakeLists.txt line:41)
target_include_directories(temp PUBLIC "${MODULES_DIR}") 

# Step 4 : install the executable (CMakeLists.txt line:46)
install(TARGETS temp DESTINATION bin)
```

---

## Adding more modules :

Yo do not have to make any changes in `'./CMakeLists.txt'` file. go to the `'/modules'` directory and create new folder with your new module name first.



To the purpose of maintainibly, test module renamed as `'${MODULE_1}'` in the `'modules/CMakeLists.txt'` file. If you want to add new module easily: 

* **Step 1 :** just use the existing lines on `'modules/CMakeLists.txt'`  by copy and paste, change the required fields then : 
    ```
        set(MODULE_2 <xxxxx>)
        set(EXECUTABLE_FILE_2 <xxxxx>.cxx)
        option(USE_MODULE_2 "Build module 2" ON)
        #
        if(USE_MODULE_2)
            # To make use  of the new library we will add an add_subdirectory() call
            add_subdirectory(${MODULE_2})
            # link the project with ${MODULE_2}
            target_link_libraries(${PROJECT_NAME} ${MODULE_2})
        endif()
    ```


* **Step 2 :** just use the existing lines on `'modules/TestLib/CMakeLists.txt'`  by copy and paste, change the required fields then : 
    ```
        add_library(${MODULE_2} ${EXECUTABLE_FILE_2})

        # state that anybody linking to us needs to include the current source dir
        target_include_directories(${MODULE_2} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")

        # ---------------------- Installing Begin ----------------------
        # specify install rules
        # we want to install the library and header file and for the application 
        # we want to install the executable and configured header.
        install(TARGETS ${MODULE_2} DESTINATION lib)
        install(FILES ${MODULES_DIR}/${MODULE_2}/${MODULE_2}.h DESTINATION include)

        # ---------------------- Installing End ----------------------
    ```

* **Step 3 :** be sure your new module structure looks like : 
    ``` 
        \MyNewModule
            CMakeLists.txt
            MyLib.h
            MyExecutable.cxx
    ```

## Extra Info:

* If your new module has more than 1 executables, you can link them like below,  Cmake will interpred them as dependencies.: 
    ```
        add_library(${MODULE_2} ${EXECUTABLE_FILE_2} {EXECUTABLE_FILE_4} {EXECUTABLE_FILE_5} ... )
    ```

* If your multiple files does not dependent, you can use this approach and you can import it then : 
    ```
        add_library(other_module other_executable.cpp)
        target_include_directories(other_module INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
        install(TARGETS other_executable DESTINATION lib)
    ```

* You can add more than 1 header files also, just follow same steps and do not forget add new installation rule to the : 
    ```
        install(FILES ${MODULES_DIR}/${MODULE_2}/${MODULE_3}.h DESTINATION include)
    ```



