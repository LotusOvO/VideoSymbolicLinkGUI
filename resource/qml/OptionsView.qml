import QtQuick
import QtQuick.Controls

Item {
    id: optionsView
    width: 400
    height: 260
    anchors.horizontalCenter: parent.horizontalCenter
    Column{
        anchors.topMargin: 5
        anchors.top: parent.top
        spacing: 10
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.3
                Text{
                    id: yearText
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: "年份"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: yearInput
                    anchors.left: yearText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.4
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    maximumLength: 4
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('year', yearInput.text)
                    }
                }
            }
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.5
                Text{
                    id: nameText
                    width: parent.width * 0.15
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: "名称"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: nameInput
                    anchors.left: nameText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.7
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    clip: true
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('name', nameInput.text)
                    }
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.5
                Rectangle{
                    id: copyCheckBox
                    property bool checked: true
                    width: 20
                    height: width
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 1
                    radius: width / 5.0
                    Rectangle{
                        width: parent.width * 0.5
                        height: width
                        radius: width / 5.0
                        color: copyCheckBox.checked ? "black" : "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            copyCheckBox.checked = !copyCheckBox.checked
                        }
                    }
                    onCheckedChanged: {
                        symbolicLinkManager.update_value('copy_small_file_flag', checked)
                    }
                }
                Text{
                    id: copyText1
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: copyCheckBox.right
                    anchors.leftMargin: 2
                    text: "复制小于"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: copySizeInput
                    anchors.left: copyText1.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.22
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    clip: true
                    text: '100'
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('small_file_size', Number(copySizeInput.text) * 1024)
                    }
                }
                Text{
                    id: copyText2
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: copySizeInput.right
                    anchors.leftMargin: 1
                    text: "K的文件"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.3
                Rectangle{
                    id: prefixCheckBox
                    property bool checked: true
                    width: 20
                    height: width
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 1
                    radius: width / 5.0
                    Rectangle{
                        width: parent.width * 0.5
                        height: width
                        radius: width / 5.0
                        color: prefixCheckBox.checked ? "black" : "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            prefixCheckBox.checked = !prefixCheckBox.checked
                        }
                    }
                    onCheckedChanged: {
                        symbolicLinkManager.update_value('prefix_flag', checked)
                    }
                }
                Text{
                    id: prefixText
                    width: parent.width * 0.7
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: prefixCheckBox.right
                    anchors.leftMargin: 5
                    text: "添加SXXEXX前缀"
                    font.pointSize: 8
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.25
                Rectangle{
                    id: seasonCheckBox
                    property bool checked: true
                    width: 20
                    height: width
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 1
                    radius: width / 5.0
                    Rectangle{
                        width: parent.width * 0.5
                        height: width
                        radius: width / 5.0
                        color: seasonCheckBox.checked ? "black" : "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            seasonCheckBox.checked = !seasonCheckBox.checked
                        }
                    }
                    onCheckedChanged: {
                        symbolicLinkManager.update_value('multi_season', checked)
                    }
                }
                Text{
                    id: seasonCheckBoxText
                    width: parent.width * 0.5
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: seasonCheckBox.right
                    anchors.leftMargin: 5
                    text: "按季整理"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            Rectangle{
                color: "transparent"
                height: 30
                width: optionsView.width * 0.2
                Text{
                    id: seasonText1
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 2
                    text: "第"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: seasonInput
                    anchors.left: seasonText1.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    maximumLength: 2
                    clip: true
                    text: '1'
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('season', seasonInput.text)
                    }
                }
                Text{
                    id: seasonText2
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: seasonInput.right
                    anchors.leftMargin: 2
                    text: "季"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.8
                Text{
                    id: indexText1
                    width: parent.width * 0.1
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    text: "从"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: indexBeginInput
                    anchors.left: indexText1.right
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.1
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    clip: true
                    maximumLength: 3
                    text: '1'
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('begin', indexBeginInput.text)
                    }
                }
                Text{
                    id: indexText2
                    width: parent.width * 0.5
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: indexBeginInput.right
                    anchors.leftMargin: 1
                    text: "开始编号，每个编号重复"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextInput{
                    id: indexRepeationInput
                    anchors.left: indexText2.right
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.1
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    clip: true
                    maximumLength: 3
                    text: '1'
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('repetition', indexRepeationInput.text)
                    }
                }
                Text{
                    id: indexText3
                    width: parent.width * 0.1
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: indexRepeationInput.right
                    anchors.leftMargin: 1
                    text: "次"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.5
                Text{
                    id: excludeText
                    width: parent.width * 0.3
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    text: "排除后缀"
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                TextField{
                    id: excludeInput
                    anchors.left: excludeText.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.8
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    clip: true
                    text: 'txt,zip,rar,7z'
                    Rectangle{
                        anchors.fill: parent
                        color:'transparent'
                        border.width: 1
                        radius: 3
                    }
                    onTextChanged: {
                        symbolicLinkManager.update_value('exclude_suffix', excludeInput.text)
                    }
                }
            }
            Rectangle{
                color: 'transparent'
                height: 30
                width: optionsView.width * 0.3
                Rectangle{
                    id: subtitleBox
                    property bool checked: true
                    width: 20
                    height: width
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 1
                    radius: width / 5.0
                    Rectangle{
                        width: parent.width * 0.5
                        height: width
                        radius: width / 5.0
                        color: subtitleBox.checked ? "black" : "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            subtitleBox.checked = !subtitleBox.checked
                        }
                    }
                    onCheckedChanged: {
                        symbolicLinkManager.update_value('subtitle_flag', checked)
                    }
                }
                Text{
                    id: subtitleBoxText
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: subtitleBox.right
                    anchors.leftMargin: 5
                    text: "只保留简体字幕并重命名"
                    font.pointSize: 10
                    wrapMode: Text.WrapAnywhere
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle{
                width: optionsView.width * 0.3
                height:40
                radius: 5
                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width - 6
                    height: parent.height - 6
                    border.width: 1
                    radius: 5
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Link start!"
                        font.pointSize: 10
                        wrapMode: Text.WrapAnywhere
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = 'light gray'
                        }
                        onExited: {
                            parent.color = 'transparent'
                        }
                        onPressed: {
                            parent.parent.color = "#ececec"
                        }
                        onReleased: {
                            parent.parent.color = 'transparent'
                        }
                        onClicked: {
                            symbolicLinkManager.make_symbolic_link()
                        }
                    }
                }
            }
        }
    }
}
