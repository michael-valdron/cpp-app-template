cmake_minimum_required(VERSION 3.10)

project(
    cpp-app-template
    VERSION 1.0 
    LANGUAGES CXX)

file(GLOB_RECURSE SOURCES "src/*.cc")
add_executable(${PROJECT_NAME} ${SOURCES})
