# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.18)

project(simpleprojcpp VERSION "0.1.0")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake
	${CMAKE_SOURCE_DIR}/external/gl3w/share/gl3w)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER XXX_CMakePredefined)

set(CMAKE_DEBUG_POSTFIX d)
set(CMAKE_CXX_STANDARD 11)

# Settings related to external tools
set(TCLAP_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/externals/tclap/include)

find_package(gl3w)

# << Documentation handling >>

# Require dot, treat the other components as optional
option(BUILD_DOC "Build documentation" ON)

# check if Doxygen is installed
find_package(Doxygen)

add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(docs)

