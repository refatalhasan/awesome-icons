cmake_minimum_required(VERSION 3.10)

project(HelloWorld VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Threads REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

add_library(core_lib STATIC
    src/core/utils.cpp
    src/core/logger.cpp
    src/core/config.cpp
)

target_include_directories(core_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_executable(hello main.cpp)
target_link_libraries(hello PRIVATE
    core_lib
    Threads::Threads
    ${OPENGL_LIBRARIES}
    ${GLUT_LIBRARIES}
)

add_executable(tests
    tests/main_test.cpp
    tests/utils_test.cpp
)

enable_testing()
add_test(NAME unit_tests COMMAND tests)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


