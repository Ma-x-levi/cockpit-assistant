import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    /*!< the define of signals. */
    signal clicked()

    implicitWidth: layoutWidth   // 重要！用于Layout计算
    implicitHeight: layoutHeight // 重要！
    Layout.preferredWidth: layoutWidth
    Layout.preferredHeight: layoutHeight
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

    /*!< SmartButton properties. */
    property string   icon:                     "null"
    property string   name:                     "default"
    property string   nameColor:                "green"
    property string   layoutBackgroundColor:    "white"
    property string   layoutBorderColor:        "black"
    property int      layoutBorderWidth:        2
    property int      layoutWidth:              80
    property int      layoutHeight:             80
    property int      layoutRadius:             80
    property font     font:                     Qt.font({pixelSize:12, family:"Arial"})
    property var      customOnClicked:          function() { console.log("默认点击处理") }

    Rectangle {
        width: layoutWidth
        height: layoutHeight 
        color: layoutBackgroundColor
        radius: layoutRadius
        border.color: layoutBorderColor  // 边框颜色
        border.width: layoutBorderWidth        // 边框宽度
        
    }

    Text {
        id: label
        color:  nameColor
        text: root.name                      // 显示的文字内容
        font: root.font                      // 文字字体
        anchors.centerIn: parent             // 在父元素中居中
    }

    /* 鼠标点击区域 */
    MouseArea {
        anchors.fill: parent                 // 填充整个按钮区域
        onClicked: root.clicked()           // 点击时触发信号
    }

    Image {
      id: _icon
    //   source:     "qrc:/qml/Widgets/connected.svg" 
      sourceSize.width: root.layoutWidth
      sourceSize.height: root.layoutHeight
      Layout.alignment: Qt.AlignHCenter
    }


    onClicked:{
        console.log(name + " was clicked")
        root.customOnClicked()
    } 
}
