import QtQuick
import QtQuick.Dialogs

//import "qrc:/qml/"
import "resource/qml/"

Window {
    width: 500
    height: 700
    visible: true
    title: "VideoSymbolicLinkGUI"
    id: rootwindow
    MessageWindow{
        x: rootwindow.x + (rootwindow.width - width) / 2
        y: rootwindow.y + (rootwindow.height - height) / 2
    }
    FolderSelector{
        id: folderSelector
    }
    OptionsView{
        id: optionsView
        anchors.top: folderSelector.bottom
    }
}
