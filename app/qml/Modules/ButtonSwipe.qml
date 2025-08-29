import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
// import QtQuick.Svg

Item {
    id: root

    property int      cellHeight:               100
    property int      cellWidth:                100
    property int      buttonHeight:             80
    property int      buttonWidth:              80

    property int      buttonColsCount:          Math.floor(root.width / cellWidth)
    property int      buttonRowsCount:          Math.floor(root.height / cellHeight)
    property int      buttonPerPageCount:       buttonColsCount * buttonRowsCount
    property int      buttonPageCount:          Math.ceil(buttonList.count / buttonPerPageCount)
    property var      actionCallback:           function(option){}

    property var      buttonGroup :             []

    SwipeView {
        id: swipeView
        anchors.fill: parent
        interactive: true  // 确保可以手势翻页

        Repeater {
            model: root.buttonGroup   // 三页图标

            GridView {

                width: swipeView.width
                height: swipeView.height
                
                cellWidth: root.cellWidth
                cellHeight: root.cellHeight
                model: modelData

                delegate: Rectangle {
                    width: buttonWidth 
                    height: buttonHeight
                    color: "skyblue"
                    radius: 10

                    Image {
                        width: parent.width 
                        height: parent.height
                        source: icon
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true   // 鼠标悬停生效

                        // 点击按下
                        onPressed: {
                            runAction("onPressed")
                            parent.color = "lightgreen"
                        }

                        // 松开
                        onReleased: {
                            runAction("onReleased")
                            parent.color = "skyblue"     // 恢复颜色
                        }

                        // 点击完成（按下+松开）
                        onClicked: {
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

        // // 平滑翻页动画
        // onCurrentIndexChanged: {
        //     console.log("翻到第 " + currentIndex + " 页");
        // }

        // Behavior on currentIndex {
        //     NumberAnimation {
        //         duration: 400
        //         easing.type: Easing.OutCubic
        //     }
        // }
    }


    // 底部指示器
    // PageIndicator {
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     count: swipeView.count
    //     currentIndex: swipeView.currentIndex
    // }

    function addButton(group, name, icon) {
        // if()
    }



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