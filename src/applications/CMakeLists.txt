# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

# << Build targets >>

set(SIMPLEAPP_SOURCES
	main.cpp
)

add_executable(simpleapp ${SIMPLEAPP_SOURCES})
target_link_libraries(simpleapp sa::utilslib)
