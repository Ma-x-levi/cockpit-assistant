import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    property int      iconHeight:            80
    property int      iconWidth:             80

    ListModel {
        id: iconList
        ListElement { name: "Item 1" }
        ListElement { name: "Item 2" }
        // 可以动态添加更多项目
    }
    
    Column {
        anchors.fill: parent
        
        // 添加和删除按钮
        Row {
            spacing: 10
            padding: 10
            
            Button {
                text: "添加项目"
                onClicked: addItem()
            }
            
            Button {
                text: "清空列表"
                onClicked: iconList.clear()
            }
        }
        
        // 使用Repeater显示列表
        Flow {
            width: parent.width
            spacing: 10
            padding: 10
            
            Repeater {
                model: iconList
                delegate: Rectangle {
                    width: iconHeight 
                    height: iconWidth
                    color: "lightgreen"
                    radius: 5
                    
                    Text { 
                        anchors.centerIn: parent
                        text: name 
                    }
                    
                    // 点击删除自身
                    MouseArea {
                        anchors.fill: parent
                        onClicked: removeItem(index)
                    }
                }
            }
        }
    }
    
    // 动态向ListModel添加或移除项目
    function addItem() {
        iconList.append({"name": "New Item " + (iconList.count + 1)})
    }
    
    function removeItem(index) {
        iconList.remove(index)
    }


}