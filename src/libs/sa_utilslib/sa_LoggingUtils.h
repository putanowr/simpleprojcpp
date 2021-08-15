// SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
// SPDX-License-Identifier: MIT

//! 
//! @file
//! @brief Provide utilities for logging.
//! 

#pragma once
#include <string>

namespace sa_utils
{

//!
//! @brief Set enable flag to given value for all loggers.
//! 
//! @param state If @c true enable loggers otherwise disable them.
//!
void setAllLoggersEnabledTo(bool state);

//!
//! @brief Disable all loggers.
//!
void disableAllLoggers();

//!
//! @brief Enable all loggers.
//! 
void enableAllLoggers();

} // namespace sa_utils
