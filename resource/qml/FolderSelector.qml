import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls

Item{
    id: fileSelector
    width: 400
    height:150
    anchors.horizontalCenter: parent.horizontalCenter
    Column {
        anchors.topMargin: 15
        anchors.top: parent.top
        spacing: 10
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle {
                y: 3
                width: fileSelector.width * 0.7
                height: 24
                border.width: 1
                property bool showmore: false
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    id: inputPath
                    text: qsTr("输入文件夹")
                    elide: Text.ElideLeft
                    wrapMode: parent.showmore ? Text.WrapAnywhere : Text.NoWrap
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    onTextChanged: {
                        parent.height = inputPath.height > 24 ? inputPath.height : 24
                    }
                }
                radius: 5
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        parent.showmore = !parent.showmore
                        parent.height = inputPath.height > 24 ? inputPath.height : 24
                    }
                }
            }

            FolderDialog {
                id: inputFolderChosen
                acceptLabel: "选择当前文件夹"
                onAccepted: {
                    inputPath.text = currentFolder.toString(
                    ).substring(8) + '/'
                    symbolicLinkManager.update_value('src_path', inputPath.text)
                }
            }
            Rectangle {
                id: chooseInputFolderButton
                width: fileSelector.width * 0.1
                height: 30
                color: "transparent"
                radius: 5
                border.width: 3
                border.color: chooseInputFolderButtonArea.pressed ? "#ececec" : "transparent"
                Rectangle {
                    width: parent.width - 6
                    height: parent.height - 6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    radius: 5
                    color: "transparent"
                }
                Image {
                    width: parent.height - 6
                    height: width
                    anchors.centerIn: parent
                    source: "qrc:/img/folder.png"
                }
                MouseArea {
                    id: chooseInputFolderButtonArea
                    anchors.fill: parent
                    onClicked: {
                        inputFolderChosen.open()
                    }
                }
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Rectangle {
                y: 3
                width: fileSelector.width * 0.7
                height: 24
                border.width: 1
                property bool showmore: false
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    id: outputPath
                    text: qsTr("输出文件夹")
                    elide: Text.ElideLeft
                    wrapMode: parent.showmore ? Text.WrapAnywhere : Text.NoWrap
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    onTextChanged: {
                        parent.height = inputPath.height > 24 ? inputPath.height : 24
                    }
                }
                radius: 5
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        parent.showmore = !parent.showmore
                        parent.height = inputPath.height > 24 ? inputPath.height : 24
                    }
                }
            }

            FolderDialog {
                id: outputFolderChosen
                acceptLabel: "选择当前文件夹"
                onAccepted: {
                    outputPath.text = currentFolder.toString(
                    ).substring(8) + '/'
                    symbolicLinkManager.update_value('dst_path', outputPath.text)
                }
            }
            Rectangle {
                id: chooseOutputFolderButton
                width: fileSelector.width * 0.1
                height: 30
                color: "transparent"
                radius: 5
                border.width: 3
                border.color: chooseOutputFolderButtonArea.pressed ? "#ececec" : "transparent"
                Rectangle {
                    width: parent.width - 6
                    height: parent.height - 6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    radius: 5
                    color: "transparent"
                }
                Image {
                    width: parent.height - 6
                    height: width
                    anchors.centerIn: parent
                    source: "../img/folder.png"
                }
                MouseArea {
                    id: chooseOutputFolderButtonArea
                    anchors.fill: parent
                    onClicked: {
                        outputFolderChosen.open()
                    }
                }
            }
        }
    }
}
