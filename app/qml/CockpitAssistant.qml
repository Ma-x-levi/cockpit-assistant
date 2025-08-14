import QtQuick
import QtWebSockets
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

import "Dialogs" as Dialogs
import "MainWindow" as MainWindow
import "Widgets" as Widgets



MainWindow.Root {
    id: mainWindow
    // onClosing: (close) => app.handleClose(close)

    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")

    // ColumnLayout {
    //     id: layout
    //     spacing: 0
    //     anchors.fill: parent

    //     Text {
    //         text: "Hello Qt6!"
    //         // anchors.centerIn: parent
    //     }

    //     Text {
    //         text: "Hello Qt6111!"
    //         // anchors.centerIn: parent
    //     }

    //     RowLayout {
    //         id: layoutff
    //         spacing: 1
    //         anchors.fill: parent

    //         Widgets.SmartButton {
    //             name: qsTr("SmartButton1")
    //         }

    //         Widgets.SmartButton {
    //             name: qsTr("SmartButton2")
    //         }

    //         Widgets.SmartButton {
    //             name: qsTr("SmartButton3")
    //         }
    //     }
    // }
    // property int appLaunchCount: 0
    // property string documentTitle: ""
    // property bool firstValidFrame: false
    // property bool automaticUpdates: false

    // 定义3个不同的界面
    Component {
        id: page1
        Rectangle {
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: "这是界面1"
                font.pixelSize: 24
            }
        }
    }

    Component {
        id: page2
        Rectangle {
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                text: "这是界面2"
                font.pixelSize: 24
            }
        }
    }

    Component {
        id: page3
        Rectangle {
            color: "lightpink"
            Text {
                anchors.centerIn: parent
                text: "这是界面3"
                font.pixelSize: 24
            }
        }
    }

    // 主布局
    RowLayout {
        anchors.fill: parent
        spacing: 10

        // 内容显示区域
        Rectangle {
            id: contentArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "gray"
            border.width: 1

            // 使用Loader加载不同界面
            Loader {
                id: contentLoader
                anchors.fill: parent
                sourceComponent: page1 // 默认显示第一个界面
            }
        }

        // 按钮区域
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            // Button {
            //     text: "界面1"
            //     onClicked: contentLoader.sourceComponent = page1
            // }

            // Button {
            //     text: "界面2"
            //     onClicked: contentLoader.sourceComponent = page2
            // }

            // Button {
            //     text: "界面3"
            //     onClicked: contentLoader.sourceComponent = page3
            // }

            Widgets.SmartButton {
                name: qsTr("界面1")
                customOnClicked: function() {contentLoader.sourceComponent = page1}
            }

            Widgets.SmartButton {
                name: qsTr("界面2")
                customOnClicked: function() {contentLoader.sourceComponent = page2}
            }

            Widgets.SmartButton {
                name: qsTr("界面3")
                customOnClicked: function() {contentLoader.sourceComponent = page3}
            }
        }
    }
}
