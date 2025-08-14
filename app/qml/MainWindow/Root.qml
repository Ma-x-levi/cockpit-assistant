import QtCore
import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

import "../Widgets" as Widgets

Widgets.SmartWindow {
  id: root
  category: "MainWindow"
//   minimumWidth: layout.implicitWidth
//   minimumHeight: layout.implicitHeight
//   title: qsTr("%1 - %2").arg(documentTitle).arg(Cpp_AppName)


  width: 640
  height: 480
  visible: true
  title: qsTr("Hello World")

  //
  // Custom properties
  //
  property int appLaunchCount: 0
  property string documentTitle: ""
  property bool firstValidFrame: false
  property bool automaticUpdates: false
}