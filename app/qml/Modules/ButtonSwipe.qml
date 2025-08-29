import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
// import QtQuick.Svg

Item {

    property int      cellHeight:              100
    property int      cellWidth:               100
    property int      buttonIconHeight:        80
    property int      buttonIconWidth:         80

    property int      buttonPageSize:          10
    property int      buttonPageCount:         Math.ceil(buttonList.count / buttonPageSize)
    property var      actionCallback:          function(option){}

    ListModel 
    {
        id: buttonList
        ListElement { name: "Button 1"; icon: "qrc:/qml/Images/Samples/icon_test1.svg"}
        ListElement { name: "Button 2"; icon: "qrc:/qml/Images/Samples/icon_test2.svg"}
    }


    // property int      cellHeight:               100
    // property int      cellWidth:                100
    // property int      buttonIconHeight:         80
    // property int      buttonIconWidth:          80

    // property int      buttonColsCount:          Math.floor(width / cellWidth)
    // property int      buttonRowsCount:          Math.floor(height / cellHeight)
    // property int      buttonPerPageCount:       buttonColsCount * buttonRowsCount
    // property int      buttonPageCount:          Math.ceil(buttonList.count / buttonPerPageCount)
    // property var      actionCallback:           function(option){}



    // ListModel {
    //     id: buttonList
    //     ListElement { name: "Button 1"; icon: "qrc:/qml/Images/Samples/icon_test1.svg"}
    //     ListElement { name: "Button 2"; icon: "qrc:/qml/Images/Samples/icon_test2.svg"}
    // }


    SwipeView {
        id: swipeView
        anchors.fill: parent
        interactive: true  // 确保可以手势翻页

        Repeater {
            model: buttonPageSize   // 三页图标

            Item {
                width: swipeView.width
                height: swipeView.height

                GridView {
                    anchors.fill: parent
                    cellWidth: buttonIconWidth + 10
                    cellHeight: buttonIconHeight + 10
                    model: buttonList
                    delegate: Rectangle {
                        width: buttonIconWidth 
                        height: buttonIconHeight
                        color: "skyblue"
                        radius: 10

                        Image {
                            width: parent.width 
                            height: parent.height
                            source: icon
                            // width: buttonIconWidth 
                            // height: buttonIconHeight
                        }

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true   // 鼠标悬停生效

                            // 点击按下
                            onPressed: {
                                // if (actions["pressed"]) actions["pressed"]()
                                runAction("onPressed")
                                parent.color = "lightgreen"
                            }

                            // 松开
                            onReleased: {
                                // if (actions["released"]) actions["released"]()
                                runAction("onReleased")
                                parent.color = "skyblue"     // 恢复颜色
                            }

                            // 点击完成（按下+松开）
                            onClicked: {
                                // if (actions["clicked"]) actions["clicked"]()

                                runAction("onClicked")
                            }

                            // 长按（超过 500ms）
                            onPressAndHold: {
                                runAction("onPressAndHold")
                                parent.color = "orange"
                            }

                            // 可调整长按时间
                            pressAndHoldInterval: 800  // 毫秒
                        }
                    }
                }
            }
        }

        // 平滑翻页动画
        onCurrentIndexChanged: {
            console.log("翻到第 " + currentIndex + " 页");
        }

        Behavior on currentIndex {
            NumberAnimation {
                duration: 400
                easing.type: Easing.OutCubic
            }
        }
    }


    // 底部指示器
    // PageIndicator {
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     count: swipeView.count
    //     currentIndex: swipeView.currentIndex
    // }

    function addItem(name, icon) {
        buttonList.append({"name": name, "icon": icon})
    }
    
    function removeItem(index) {
        buttonList.remove(index)
    }

    function runAction(option) {
        if(actionCallback instanceof Function) actionCallback(option)
    }
}