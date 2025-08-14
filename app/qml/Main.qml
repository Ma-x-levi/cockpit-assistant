import QtQuick
import QtWebSockets
import QtQuick.Window
import QtQuick.Controls

import "Dialogs" as Dialogs
import "MainWindow" as MainWindow

// Item {
//   id: app
//   // category: "Test"

//   //
//   // Ask the user to save the project file before closing the app
//   //
//   function handleClose(close) {
//     close.accepted = false
//     if (Cpp_JSON_ProjectModel.askSave()) {
//       close.accepted = true
//       Qt.quit();
//     }
//   }

  //
  // Main window + subdialogs
  //
  MainWindow.Root {
    id: mainWindow
    onClosing: (close) => app.handleClose(close)

    // width: 320
    // height: 240
    // visible: true
    // title: qsTr("Hello World")

    Item { // 根 Item，作为 Window 的直接子元素
        anchors.fill: parent
        Text {
            text: "Hello Qt6!"
            anchors.centerIn: parent
        }
    }



    property int appLaunchCount: 0
    property string documentTitle: ""
    property bool firstValidFrame: false
    property bool automaticUpdates: false

    // Dialogs.IconPicker {
    //   id: actionIconPicker
    // }

    // Dialogs.CsvPlayer {
    //   id: csvPlayer
    // }

    // Dialogs.Donate {
    //   id: donateDialog
    // }

    // DialogLoader {
    //   id: mqttConfiguration
    //   source: "qrc:/qml/Dialogs/MQTTConfiguration.qml"
    // }

    // DialogLoader {
    //   id: aboutDialog
    //   source: "qrc:/qml/Dialogs/About.qml"
    // }

    // DialogLoader {
    //   id: acknowledgementsDialog
    //   source: "qrc:/qml/Dialogs/Acknowledgements.qml"
    // }

    // DialogLoader {
    //   id: fileTransmissionDialog
    //   source: "qrc:/qml/Dialogs/FileTransmission.qml"
    // }

    // function showAcknowledgements()  { acknowledgementsDialog.active = true }
  }

// }