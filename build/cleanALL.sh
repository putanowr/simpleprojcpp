#!/bin/bash

# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

rm -fr bin docs src tests external \
		CMakeCache.txt CMakeFiles Makefile cmake_install.cmake \
		Testing CTestTestfile.cmake \
		ALL_BUILD.vcxproj ALL_BUILD.vcxproj.filters \
		Debug Release Win32 \
		NewtonBodies.sln \
		ZERO_CHECK.vcxproj \
		ZERO_CHECK.vcxproj.filters \
		myeasylog.log \
		CMakeDoxyfile.in \
		CMakeDoxygenDefaults.cmake \
		simpleprojcpp.sln
