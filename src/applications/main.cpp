// SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
// SPDX-License-Identifier: MIT

#include "easylogging++.h"
#include "sa_application.h"

INITIALIZE_EASYLOGGINGPP

#include <stdlib.h>

int main(int argc, char *argv[])
{
	sa_utils::enableAllLoggers();
	LOG(INFO) << "Running simpleapp";
	return EXIT_SUCCESS;
}
