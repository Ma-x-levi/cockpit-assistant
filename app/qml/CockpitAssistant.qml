// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Window 2.15

// ApplicationWindow {
//     visible: true
//     width: 640
//     height: 480

//     menuBar: MenuBar {
//         Menu {
//             title: "File"
//             MenuItem { text: "Open..." }
//             MenuItem { text: "Close" }
//         }

//         Menu {
//             title: "File2"
//             MenuItem { text: "Open..." }
//             MenuItem { text: "Close" }
//         }
//     }

//     // 主内容区域
//     Label {
//         text: "Hello, World!"
//         anchors.centerIn: parent
//     }

//     // statusBar: StatusBar {
//     //     // 状态栏内容
//     // }



//     // SwipeView {
//     //     id: swipeView
//     //     anchors.fill: parent
//     //     interactive: true  // 确保可以手势翻页

//     //     Repeater {
//     //         model: 3   // 三页图标

//     //         Item {
//     //             width: swipeView.width
//     //             height: swipeView.height

//     //             GridView {
//     //                 anchors.fill: parent
//     //                 cellWidth: 100
//     //                 cellHeight: 100
//     //                 model: 120  // 每页 12 个图标
//     //                 delegate: Rectangle {
//     //                     width: 80; height: 80
//     //                     color: "skyblue"
//     //                     radius: 10
//     //                     Text {
//     //                         anchors.centerIn: parent
//     //                         text: "图标 " + index
//     //                     }
//     //                 }
//     //             }
//     //         }
//     //     }

//     //     // 平滑翻页动画
//     //     onCurrentIndexChanged: {
//     //         console.log("翻到第 " + currentIndex + " 页");
//     //     }

//     //     Behavior on currentIndex {
//     //         NumberAnimation {
//     //             duration: 400
//     //             easing.type: Easing.OutCubic
//     //         }
//     //     }
//     // }

//     // // 底部指示器
//     // PageIndicator {
//     //     anchors.bottom: parent.bottom
//     //     anchors.horizontalCenter: parent.horizontalCenter
//     //     count: swipeView.count
//     //     currentIndex: swipeView.currentIndex
//     // }





import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts


import "Modules" as Modules

Window {
    width: 400
    height: 600
    visible: true

    

    ColumnLayout {
        anchors.fill: parent

        Column {
            Layout.fillWidth: true
            height:   200
            
            // 添加和删除按钮
            Row {
                spacing: 10
                padding: 10
                
                Button {
                    text: "添加项目"
                    onClicked: testSwipe2.addItem("Button 1", "qrc:/qml/Images/Samples/icon_button1.png")
                }
                
                Button {
                    text: "清空列表"
                    onClicked: testSwipe2.removeItem(0)
                }
            }
        }


        Modules.SmartFlow {
            id: smartFlow
            // anchors.fill: parent
            // anchors.left: parent.left    // 左边缘对齐父元素左边缘
            // anchors.right: parent.right  // 右边缘对齐父元素右边缘
            Layout.fillWidth: true
            height:   120

            iconHeight: 40
            iconWidth:  40
        }

        Modules.ButtonSwipe {
            id: testSwipe2
            // anchors.left: parent.left    // 左边缘对齐父元素左边缘
            // anchors.right: parent.right  // 右边缘对齐父元素右边缘
            Layout.fillWidth: true
            height:   120
            // Layout.fillHeight: true


            ListModel {
                id: buttonList
                ListElement { name: "Button 1"; icon: "qrc:/qml/Images/Samples/icon_test1.svg"}
                ListElement { name: "Button 2"; icon: "qrc:/qml/Images/Samples/icon_test2.svg"}
                ListElement { name: "Button 3"; icon: "qrc:/qml/Images/Samples/icon_test3.svg"}
            }

            ListModel {
                id: buttonList1
                ListElement { name: "Button 1"; icon: "qrc:/qml/Images/Samples/icon_test3.svg"}
                ListElement { name: "Button 2"; icon: "qrc:/qml/Images/Samples/icon_test2.svg"}
                ListElement { name: "Button 3"; icon: "qrc:/qml/Images/Samples/icon_test1.svg"}
            }

            buttonGroup: [buttonList, buttonList1]


            cellHeight:   50
            cellWidth:    50
            buttonHeight: 40
            buttonWidth:  40

            actionCallback: function(option) { console.log("ButtonSwipe1 Action: " + option) }
        }

        Modules.ButtonSwipe {
            id: testSwipe3
            // anchors.left: parent.left    // 左边缘对齐父元素左边缘
            // anchors.right: parent.right  // 右边缘对齐父元素右边缘
            Layout.fillWidth: true
            height:   120
            // Layout.fillHeight: true


            cellHeight:   50
            cellWidth:    50
            buttonHeight: 40
            buttonWidth:  40

            actionCallback: function(option) { console.log("ButtonSwipe2 Action: " + option) }
        }
    }
}
