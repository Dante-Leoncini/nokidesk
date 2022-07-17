import QtQuick 1.1

Item {
    id: window2

Rectangle {
    id: trackpad
    property int originalX: 0
    property int originalY: 0
    color: "red"
    width: parent.width
    height: parent.height
    y: 22

    //Senales
    //signal enviarx(string x) //posicion X
    //signal enviary(string y) //posicion Y

    MouseArea {
        id: areaTouch
        width: parent.width
        height: parent.height
        onPressed: {originalX = mouseX; originalY = mouseY}
        onMouseXChanged: {enviarx(mouseX - originalX); originalX = mouseX}
        onMouseYChanged: {enviary(mouseY - originalY); originalY = mouseY}
    }
}
}
