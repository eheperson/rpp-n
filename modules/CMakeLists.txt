set(MODULE_1 TestLib)
set(EXECUTABLE_FILE_1 greetings.cxx)
option(USE_MODULE_1 "Build module 1" ON)
#
if(USE_MODULE_1)
    # To make use  of the new library we will add an add_subdirectory() call
    add_subdirectory(${MODULE_1})
    # link the project with ${MODULE_1}
    target_link_libraries(${PROJECT_NAME} ${MODULE_1})
endif()