# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.11)

set(SA_UTILSLIB_PUBLIC_HEADERS 
  easylogging++.h
  sa_LoggingUtils.h
)

set(SA_UTILSLIB_SOURCES 
  easylogging++.cc
  sa_LoggingUtils.cpp
)

add_library(sa_utilslib STATIC ${SA_UTILSLIB_SOURCES} ${SA_UTILSLIB_PUBLIC_HEADERS})

target_include_directories(sa_utilslib PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(sa_utilslib PUBLIC ELPP_FRESH_LOG_FILE)
target_compile_definitions(sa_utilslib PUBLIC UNICODE _UNICODE)

set_target_properties(sa_utilslib PROPERTIES FOLDER libraries)
set_target_properties(sa_utilslib PROPERTIES PUBLIC_HEADER "${SA_UTILSLIB_PUBLIC_HEADERS}")
