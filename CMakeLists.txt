cmake_minimum_required(VERSION 3.10)

project(
    cpp-app-template
    VERSION 1.0 
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add submodules
#
# Example:
# add_subdirectory(extern/<submodule>)
# ...

include_directories(include)

file(GLOB_RECURSE SOURCES "src/*.cc")
add_executable(${PROJECT_NAME} ${SOURCES})

# Link submodules
#
# Example:
# target_include_directories(${PROJECT_NAME}
#     PUBLIC extern/<submodule>/include
#     ...
# )
# target_link_libraries(${PROJECT_NAME} <submodule_binary_name>)
# ...
