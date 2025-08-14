/*
 * Copyright (C) 2020-2025 Max Levi
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later OR Commercial
 */

#include <iostream>

#include <QWidget>
#include <QThread>
#include <QSysInfo>
#include <QSettings>
#include <QQuickStyle>
#include <QApplication>
#include <QStyleFactory>


#include "AppInfo.h"
// #include "Module/ModuleManager.h"

#include "CockpitAssistant.h"


#ifdef Q_OS_WIN
    #include <windows.h>
    #include <cstring>
#endif

#ifdef Q_OS_LINUX
    #include <QDir>
    #include <QFile>
    #include <QFileInfo>
    #include <QStandardPaths>
#endif


#include "mainwindow.h"




int main(int argc, char *argv[])
{
    //show qt verssion
    std::cout << "Qt Version: " << QT_VERSION_STR << std::endl;

    // Set application info
    QApplication::setApplicationName(APP_EXECUTABLE);
    QApplication::setOrganizationName(APP_DEVELOPER);
    QApplication::setApplicationVersion(APP_VERSION);
    QApplication::setApplicationDisplayName(APP_NAME);
    QApplication::setOrganizationDomain(APP_SUPPORT_URL);

    // Avoid 200% scaling on 150% scaling...
    auto policy = Qt::HighDpiScaleFactorRoundingPolicy::PassThrough;
    QApplication::setHighDpiScaleFactorRoundingPolicy(policy);

    // Initialize application
    QApplication app(argc, argv);

    // Set thread priority
    QThread::currentThread()->setPriority(QThread::HighestPriority);

    // Set application style
    app.setStyle(QStyleFactory::create("Fusion"));
    QQuickStyle::setStyle("Fusion");

    // MainWindow w;
    // w.show();

    CockpitAssistant cockpitAssistant;
    cockpitAssistant.initializeQmlInterface();

    

    // Enter application event loop
    return app.exec();
}
