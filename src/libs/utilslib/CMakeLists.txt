# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.11)

set(UTILSLIB_PUBLIC_HEADERS 
  easylogging++.h
  sa_LoggingUtils.h
)

set(UTILSLIB_SOURCES 
  easylogging++.cc
  sa_LoggingUtils.cpp
)

add_library(utilslib STATIC ${UTILSLIB_SOURCES} ${UTILSLIB_PUBLIC_HEADERS})
add_library(sa::utilslib ALIAS utilslib)

target_include_directories(utilslib PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(utilslib PUBLIC ELPP_FRESH_LOG_FILE)
target_compile_definitions(utilslib PUBLIC UNICODE _UNICODE)

set_target_properties(utilslib PROPERTIES FOLDER libraries)
set_target_properties(utilslib PROPERTIES PUBLIC_HEADER "${UTILSLIB_PUBLIC_HEADERS}")
