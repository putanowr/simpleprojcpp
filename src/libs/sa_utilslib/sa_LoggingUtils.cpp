// SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
// SPDX-License-Identifier: MIT

#pragma once
#include "easylogging++.h"
#include "sa_LoggingUtils.h"

namespace sa_utils 
{

void setAllLoggersEnabled(const bool state)
{
	const auto value = state ? std::string("true") : std::string("false");
	el::Configurations conf;
	conf.setGlobally(el::ConfigurationType::Enabled, value);
	el::Loggers::reconfigureAllLoggers(conf);
}

void disableAllLoggers()
{
	setAllLoggersEnabled(false);
}

void enableAllLoggers()
{
	setAllLoggersEnabled(true);
}

} // namespace sa_utils 
