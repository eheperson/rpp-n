add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR})

option(USE_TESTLIB "Build TestLib" ON)
if(USE_TESTLIB)
    set(TESTLIB TestLib)
    message(STATUS "TestLib Found")
    add_definitions(-DUSE_TESTLIB)
    #
    file(GLOB TESTLIB_SOURCES TestLib.cpp)
    file(GLOB TESTLIB_HEADERS TestLib.h)
    add_library(${TESTLIB} ${TESTLIB_SOURCES} ${TESTLIB_HEADERS})
    target_link_libraries(${PROJECT_NAME} PRIVATE ${TESTLIB})
endif()


