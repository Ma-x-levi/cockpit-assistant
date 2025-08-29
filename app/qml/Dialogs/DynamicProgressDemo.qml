import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "../Widgets" as Widgets

Window {
    id: demoWindow
    width: 800
    height: 600
    visible: true
    title: qsTr("动态百分比拉条演示")
    
    // 示例数据
    property var sampleData: [
        { label: "CPU使用率", value: 0.75, color: "#007acc" },
        { label: "内存使用率", value: 0.45, color: "#28a745" },
        { label: "磁盘使用率", value: 0.82, color: "#ffc107" },
        { label: "网络使用率", value: 0.33, color: "#dc3545" }
    ]
    
    // 主布局
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        // 标题
        Text {
            text: qsTr("动态百分比拉条组件演示")
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }
        
        // 说明文字
        Text {
            text: qsTr("这个组件可以根据数据自动添加或删除百分比拉条，支持动画效果和自定义样式")
            font.pixelSize: 14
            color: "#666666"
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
        
        // 动态拉条组件
        Widgets.DynamicProgressBars {
            id: dynamicBars
            Layout.fillWidth: true
            Layout.preferredHeight: 300
            progressData: sampleData
            maxBars: 8
            barHeight: 35
            barSpacing: 12
            animationDuration: 400
            showLabels: true
            showValues: true
            backgroundColor: "#ffffff"
            defaultBarColor: "#007acc"
            textColor: "#333333"
            labelWidth: 140
            valueWidth: 70
        }
        
        // 控制面板
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            color: "#f8f9fa"
            radius: 8
            border.color: "#dee2e6"
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10
                
                Text {
                    text: qsTr("控制面板")
                    font.pixelSize: 16
                    font.bold: true
                    color: "#333333"
                }
                
                RowLayout {
                    spacing: 10
                    
                    Button {
                        text: qsTr("加载示例数据")
                        onClicked: {
                            dynamicBars.setProgressData(sampleData)
                        }
                    }
                    
                    Button {
                        text: qsTr("随机更新数据")
                        onClicked: {
                            for (let i = 0; i < dynamicBars.progressData.length; i++) {
                                dynamicBars.updateBarData(i, { value: Math.random() })
                            }
                        }
                    }
                    
                    Button {
                        text: qsTr("添加自定义拉条")
                        onClicked: {
                            const customBar = {
                                label: "自定义指标" + (dynamicBars.progressData.length + 1),
                                value: Math.random(),
                                color: "#" + Math.floor(Math.random()*16777215).toString(16)
                            }
                            dynamicBars.progressData.push(customBar)
                            dynamicBars.progressDataChanged()
                        }
                    }
                }
                
                RowLayout {
                    spacing: 10
                    
                    CheckBox {
                        id: showLabelsCheck
                        text: qsTr("显示标签")
                        checked: dynamicBars.showLabels
                        onCheckedChanged: dynamicBars.showLabels = checked
                    }
                    
                    CheckBox {
                        id: showValuesCheck
                        text: qsTr("显示数值")
                        checked: dynamicBars.showValues
                        onCheckedChanged: dynamicBars.showValues = checked
                    }
                    
                    Slider {
                        id: animationSpeedSlider
                        from: 100
                        to: 1000
                        value: dynamicBars.animationDuration
                        onValueChanged: dynamicBars.animationDuration = value
                        
                        Text {
                            anchors.left: parent.right
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("动画速度: ") + Math.round(animationSpeedSlider.value) + "ms"
                            font.pixelSize: 12
                        }
                    }
                }
            }
        }
        
        // 数据信息
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "#e9ecef"
            radius: 8
            border.color: "#ced4da"
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 5
                
                Text {
                    text: qsTr("当前数据信息")
                    font.pixelSize: 14
                    font.bold: true
                    color: "#495057"
                }
                
                Text {
                    text: qsTr("拉条数量: ") + dynamicBars.progressData.length + 
                          qsTr(" / 最大数量: ") + dynamicBars.maxBars
                    font.pixelSize: 12
                    color: "#6c757d"
                }
                
                Text {
                    text: qsTr("组件高度: ") + dynamicBars.height + "px"
                    font.pixelSize: 12
                    color: "#6c757d"
                }
            }
        }
    }
    
    // 定时器用于演示自动更新
    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: {
            // 随机更新一个拉条的值
            if (dynamicBars.progressData.length > 0) {
                const randomIndex = Math.floor(Math.random() * dynamicBars.progressData.length)
                const newValue = Math.random()
                dynamicBars.updateBarData(randomIndex, { value: newValue })
            }
        }
    }
}




