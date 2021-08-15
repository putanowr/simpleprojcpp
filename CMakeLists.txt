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

add_subdirectory(src)
add_subdirectory(tests)

# << Documentation handling >>

# Require dot, treat the other components as optional
option(BUILD_DOC "Build documentation" ON)

# check if Doxygen is installed
find_package(Doxygen)
if (DOXYGEN_FOUND)
    # set input and output files
    set(DOXYGEN_IN ${CMAKE_SOURCE_DIR}/docs/Doxyfile.in)
    set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    # request to configure the file
    configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
    message("Doxygen build started")

    # note the option ALL which allows to build the docs together with the application
    add_custom_target( doc_doxygen 
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM )
else (DOXYGEN_FOUND)
  message("Doxygen need to be installed to generate the doxygen documentation")
endif (DOXYGEN_FOUND)
