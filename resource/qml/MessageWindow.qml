import QtQuick

Window{
    id: messageWindow
    width: 300
    height: 200
//    visible: true
    flags: Qt.Dialog | Qt.FramelessWindowHint
    modality: Qt.WindowModal
    Rectangle{
        anchors.fill: parent
        color: "white"
        border.width: 1
        radius: 5
        Rectangle{
            width: parent.width - 20
            height: parent.height - 100
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                id: messageText
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: ""
                font.pointSize: 10
                wrapMode: Text.WrapAnywhere
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle{
            width: 100
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20
            anchors.bottom: parent.bottom
            border.width: 1
            radius: 5
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "OK"
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
                onClicked: {
                    messageWindow.visible = false
                }
            }
        }
    }

    Connections{
        target: symbolicLinkManager
        function onSendMessage(message){
            messageText.text = message
            messageWindow.visible = true
        }
    }
}
