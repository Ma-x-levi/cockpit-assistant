import QtQuick
import QtWebSockets
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

import "Dialogs" as Dialogs
import "MainWindow" as MainWindow
import "Widgets" as Widgets


Window {
    id: root
    // onClosing: (close) => app.handleClose(close)

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


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

    // GridView {
    //     id: grid
    //     anchors.fill: parent
    //     cellWidth: 100
    //     cellHeight: 100
    //     model: 20   // 数据数量
    //     delegate: Rectangle {
    //         width: 80; height: 80
    //         color: "lightblue"
    //         radius: 10
    //         Text {
    //             anchors.centerIn: parent
    //             text: index
    //         }
    //     }
    // }

    // PageView {
    //     anchors.fill: parent

    //     Repeater {
    //         model: 3   // 三页
    //         GridView {
    //             anchors.fill: parent
    //             cellWidth: 100; cellHeight: 100
    //             model: 12   // 每页 12 个图标
    //             delegate: Rectangle {
    //                 width: 80; height: 80
    //                 color: "skyblue"
    //                 radius: 10
    //                 Text { anchors.centerIn: parent; text: index }
    //             }
    //         }
    //     }
    // }

    // Flickable {
    //     id: flick
    //     anchors.fill: parent
    //     contentWidth: grid.width
    //     contentHeight: height
    //     clip: true
    //     boundsBehavior: Flickable.StopAtBounds

    //     Grid {
    //         id: grid
    //         width: (100 * 4) * 3    // 4 列 * 3 页
    //         height: parent.height
    //         columns: 4
    //         spacing: 10
    //         Repeater {
    //             model: 36   // 总共 36 个图标
    //             Rectangle {
    //                 width: 80; height: 80
    //                 color: "orange"
    //                 radius: 10
    //                 Text { anchors.centerIn: parent; text: index }
    //             }
    //         }
    //     }
    // }

    // PageIndicator {
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     count: 3
    //     currentIndex: pageView.currentIndex
    // }



    SwipeView {
        id: swipeView
        anchors.fill: parent

        Repeater {
            model: 3   // 三页图标

            // 每一页必须是 Item / Page
            Item {
                anchors.fill: parent

                GridView {
                    anchors.fill: parent
                    cellWidth: 100
                    cellHeight: 100
                    model: 12  // 每页 12 个图标
                    delegate: Rectangle {
                        width: 80
                        height: 80
                        color: "skyblue"
                        radius: 10
                        Text {
                            anchors.centerIn: parent
                            text: "图标 " + index
                        }
                    }
                }
            }
        }
    }

    PageIndicator {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        count: swipeView.count
        currentIndex: swipeView.currentIndex
    }


    // // 主布局
    // RowLayout {
    //     anchors.fill: parent
    //     spacing: 10

    //     // 内容显示区域
    //     Rectangle {
    //         id: contentArea
    //         Layout.fillWidth: true
    //         Layout.fillHeight: true
    //         border.color: "gray"
    //         border.width: 1

    //         // 使用Loader加载不同界面
    //         Loader {
    //             id: contentLoader
    //             anchors.fill: parent
    //             sourceComponent: page1 // 默认显示第一个界面
    //         }
    //     }

    //     // 按钮区域
    //     ColumnLayout {
    //         Layout.alignment: Qt.AlignHCenter
    //         spacing: 10

    //         Widgets.SmartButton {
    //             name: qsTr("界面1")
    //             customOnClicked: function() {contentLoader.sourceComponent = page1}
    //         }

    //         Widgets.SmartButton {
    //             name: qsTr("界面2")
    //             customOnClicked: function() {contentLoader.sourceComponent = page2}
    //         }

    //         Widgets.SmartButton {
    //             name: qsTr("界面3")
    //             customOnClicked: function() {contentLoader.sourceComponent = page3}
    //         }
    //     }
    // }
}
