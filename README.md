# cpp-app-template
Personal template for starting a C++ project.

## Requirements

This template works under GNU+Linux distributions, however, this template should
work under Windows and other UNIX based operating systems (e.g. macOS, FreeBSD,
etc.) with the following utilities:

1. [`gcc`](https://gcc.gnu.org/) and
   [`g++`](https://gcc.gnu.org/projects/cxx-status.html)
2. [`git`](https://git-scm.com/)
3. [`make`](https://www.gnu.org/software/make/)
4. [`cmake`](https://cmake.org/)

## Directory Structure

- `extern/`: Contains imported submodules
- `include/`: Contains header files
- `src/`: Contains cpp source files
- `.gitmodules`: Stores submodules repository information
- `CMakeLists.txt`: CMake config
- `Makefile`: Makefile which contains tasks for CMake

```
.
+--extern
|   +--...
+--include
|   +--...
+--src
|   +--main.cc
|   +--...
+--.gitignore
+--.gitmodules
+--CMakeLists.txt
+--Makefile
+--README.md
```

## Compile Project

You can use `make` to run the compile process which is a `make` task called
`build`, this is the default task:

```sh
make build
```
or
```sh
make
```

However, the task `build` will not run unless the output of CMake does not
exist. To recompile changes one must use the `rebuild` task:

```sh
make rebuild
```

## Run Project

Like with `make build`, you can use `make` to run the compiled executable by
using the task called `run`:

```sh
make run
```

## Clean Binaries

We can clean the generated files and directories from our compiling by using the
`clean` task:

```sh
make clean
```

## Importing Libraries

This template uses the common methods of bring in libraries. In the
`CMakeLists.txt` file:

1. We must include the libraries using [add_subdirectory](###add-submodules)
   statements for each library.
2. We must link the includes and binaries of the libraries by defining:
    1. A [target_include_directories](###link-submodules) block that contains
       paths to libraries include directories for each library.
    2. [target_link_libraries](###link-submodules) statements for each library.


## CMakeLists.txt Structure

### CMAKE Version Requirement
```cmake
cmake_minimum_required(VERSION <cmake-version-req>)
```

### Project definitions

```cmake
project(
    <project-name>
    VERSION <version>
    LANGUAGES <c-or-cxx>)
```

### Variables

```cmake
set(<var-name> <val>)
```

#### Examples
```cmake
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOURCE_DIR "${PROJECT_SOURCE_DIR}/src/")
set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/")
```

### Add submodules

```cmake
add_subdirectory(extern/<submodule>)
...
```

### Link project includes

```cmake
include_directories(<dir-with-includes>)
```

### Get source files

```cmake
file(GLOB_RECURSE SOURCES <src-patterns>)
```

### Compile executable for project

```cmake
add_executable(${PROJECT_NAME} ${SOURCES})
```

### Link submodules

```cmake
target_include_directories(${PROJECT_NAME}
    PUBLIC extern/<submodule>/include
    ...
)
target_link_libraries(${PROJECT_NAME} <submodule_binary_name>)
...
```
