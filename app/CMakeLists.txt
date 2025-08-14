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
    Gui
    Qml
    Core
    Quick
    Widgets
    PrintSupport
    QuickControls2
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
    src/CockpitAssistant.cpp
    src/Libraries/Qcustomplot/qcustomplot.cpp
    src/mainwindow.cpp
)

set(HEADERS
    src/CockpitAssistant.h
    src/Libraries/Qcustomplot/qcustomplot.h
    src/mainwindow.h
)


#-------------------------------------------------------------------------------
# Platform-specific configuration
#-------------------------------------------------------------------------------
# if(WIN32)
#     set(WIN_RC "${CMAKE_CURRENT_SOURCE_DIR}/deploy/windows/info.rc")
#     set(SOURCES ${SOURCES} ${WIN_RC} "src/Platform/NativeWindow_Windows.cpp")
# elseif(APPLE)
#     set(ICON_MACOSX "${CMAKE_CURRENT_SOURCE_DIR}/deploy/macOS/icon.icns")
#     set(INFO_MACOSX "${CMAKE_CURRENT_SOURCE_DIR}/deploy/macOS/info.plist")
#     set_source_files_properties(
#         ${ICON_MACOSX}
#         PROPERTIES MACOSX_PACKAGE_LOCATION "Resources"
#     )
#     set(SOURCES ${SOURCES} ${ICON_MACOSX} "src/Platform/NativeWindow_macOS.mm")
#     set_source_files_properties(
#         "src/Platform/NativeWindow_macOS.mm" PROPERTIES SKIP_UNITY_BUILD_INCLUSION ON
#     )
# elseif(UNIX)
#     set(SOURCES ${SOURCES} "src/Platform/NativeWindow_UNIX.cpp")
# endif()


#-------------------------------------------------------------------------------
# Add resources
#-------------------------------------------------------------------------------
qt_add_resources(QML_RCC ${CMAKE_CURRENT_SOURCE_DIR}/qml/qml.qrc)




#-------------------------------------------------------------------------------
# Create executable
#-------------------------------------------------------------------------------
qt_add_executable(
    ${PROJECT_EXECUTABLE}
    ${SOURCES}
    ${HEADERS}
    ${QML_RCC}
    MANUAL_FINALIZATION
)


target_link_libraries(
    ${PROJECT_EXECUTABLE} PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Widgets
    Qt6::PrintSupport
    Qt6::QuickControls2
)


# qt_add_qml_module(
#     app URI 
#     cockpit-assistant
#     VERSION 1.0
#     QML_FILES
#         qml/Main.qml
# )


#-------------------------------------------------------------------------------
# Qt Deployment
#-------------------------------------------------------------------------------

qt_finalize_executable(${PROJECT_EXECUTABLE})

install(
 TARGETS ${PROJECT_EXECUTABLE}
 BUNDLE  DESTINATION .
 RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

set(deploy_tool_options_arg "")
if(APPLE)
 set(deploy_tool_options_arg -hardened-runtime -appstore-compliant)
elseif(WIN32)
 set(deploy_tool_options_arg --no-compiler-runtime -force-openssl --release)
endif()

qt_generate_deploy_qml_app_script(
 TARGET ${PROJECT_EXECUTABLE}
 OUTPUT_SCRIPT deploy_script
 MACOS_BUNDLE_POST_BUILD
 NO_UNSUPPORTED_PLATFORM_ERROR
 DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
 DEPLOY_TOOL_OPTIONS ${deploy_tool_options_arg}
)

install(SCRIPT ${deploy_script})

#-------------------------------------------------------------------------------
# Packaging
#-------------------------------------------------------------------------------

set(CPACK_PACKAGE_NAME                  ${PROJECT_DISPNAME})
set(CPACK_PACKAGE_CONTACT               ${PROJECT_CONTACT})
set(CPACK_PACKAGE_VENDOR                ${PROJECT_VENDOR})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY   ${PROJECT_DESCRIPTION_SUMMARY})
set(CPACK_PACKAGE_VERSION_MAJOR         ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR         ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH         ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_DESCRIPTION_FILE      ${PROJECT_DESCRIPTION_FILE})
set(CPACK_PACKAGE_FILE_NAME             ${PROJECT_FILE_NAME})
set(CPACK_RESOURCE_FILE_LICENSE         ${PROJECT_FILE_LICENSE})

set(CPACK_MONOLITHIC_INSTALL ON)