cmake_minimum_required(VERSION 3.10)

project(
    cpp-app-template
    VERSION 1.0 
    LANGUAGES CXX)

add_subdirectory(src)

source_group(TREE src PREFIX sources)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_FILES})
