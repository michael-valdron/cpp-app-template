# cpp-app-template
# Michael Valdron
# Feb. 26, 2021

# CMAKE Version Requirement
cmake_minimum_required(VERSION 3.10)

# Project definitions
project(
    cpp-app-template
    VERSION 1.0 
    LANGUAGES CXX)

# Variables
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOURCE_DIR "${PROJECT_SOURCE_DIR}/src/")
set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/")

# Add submodules
#
# Example:
# add_subdirectory(extern/<submodule>)
# ...

# Link project includes
include_directories(include)

# Get source files
file(GLOB_RECURSE SOURCES "src/*.cc" "src/*.cpp" "src/*.cxx")

# Compile executable for project
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
