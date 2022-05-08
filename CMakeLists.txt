# Change version of the cmake accorting of your   <REQUIRED>
cmake_minimum_required(VERSION 3.22.2 FATAL_ERROR)

# set the project name with version
# ${PROJECT_NAME}
project(rppm VERSION 1.0.0)

# Specify C++ standards
# C++ standards declerations must be above the call to add_executable
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Specify C Standards
# C standards declerations must be above the call to add_executable
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)
set(CMAKE_C_EXTENSIONS ON)

# ObjectiveC Standards
if(APPLE)
    enable_language(OBJC)
endif()

# Configure the header file to pass the version number to the source code
configure_file(rppmConfig.h.in rppmConfig.h)

# add the executable
add_executable(${CMAKE_PROJECT_NAME} main.cpp)
# add_executable(temp temp.cpp) #example to add new executable : Step1


# add the binary tree to the search path for include files
# so that we will find rppmConfig.h
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}")
# target_include_directories(temp PUBLIC "${PROJECT_BINARY_DIR}") #example to add new executable : Step2


# ---------------------- Installing Begin ----------------------
# add the install targets
install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION bin)
# install(TARGETS temp DESTINATION bin) #example to add new executable : Step3 (installation)
install(FILES "${PROJECT_BINARY_DIR}/rppmConfig.h"
  DESTINATION include
  )
# ---------------------- Installing End ------------------------