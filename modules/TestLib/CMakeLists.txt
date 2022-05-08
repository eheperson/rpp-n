add_library(${MODULE_1} ${EXECUTABLE_FILE_1})

# state that anybody linking to us needs to include the current source dir
target_include_directories(${MODULE_1} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")

# ---------------------- Installing Begin ----------------------
# specify install rules
# we want to install the library and header file and for the application 
# we want to install the executable and configured header.
install(TARGETS ${MODULE_1} DESTINATION lib)
install(FILES ${MODULES_DIR}/${MODULE_1}/${MODULE_1}.h DESTINATION include)

# ---------------------- Installing End ----------------------