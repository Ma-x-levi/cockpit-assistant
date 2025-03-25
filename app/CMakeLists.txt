#
# Cockpit Assistant 
#
# Copyright (C) 2020-2025 Max Levi 
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#
# SPDX-License-Identifier: GPL-3.0-or-later OR Commercial
#


#-------------------------------------------------------------------------------
# Project setup
#-------------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.20)
project(app LANGUAGES CXX VERSION ${PROJECT_VERSION})


#-------------------------------------------------------------------------------
# C++ options
#-------------------------------------------------------------------------------
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#-------------------------------------------------------------------------------
# Add external dependencies (Qt)
#-------------------------------------------------------------------------------
find_package(
    Qt6 REQUIRED
    COMPONENTS
    Qml
    Core
    Quick
)

qt_standard_project_setup()

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

#-------------------------------------------------------------------------------
# Import source code
#-------------------------------------------------------------------------------
include_directories(src)

set(SOURCES
    src/main.cpp
)

set(HEADERS

)


#-------------------------------------------------------------------------------
# Create executable
#-------------------------------------------------------------------------------
qt_add_executable(
    ${PROJECT_EXECUTABLE}
    ${SOURCES}
    ${HEADERS}
    MANUAL_FINALIZATION
)


target_link_libraries(
    ${PROJECT_EXECUTABLE} PUBLIC
    Qt6::Core
    Qt6::Qml
    Qt6::Quick
)