import QtQuick 1.1

//Item {
//   FontLoader {
//       id: terminalvector
//       source: "../Font/TerminalVector.ttf"
//   }

Item { //Consola de windows CMD        

  Rectangle {
      x: 8; y: 30 
    width: maxi(2) -16
      height: parent.parent.parent.height -38
      color: "black"
      clip: true

    Text {
        id: terminal
        width: parent.parent.parent.width -20
        text: "raton.x: "+ raton.x + "<br>raton.y: " + raton.y
        color: Qt.rgba(192, 192, 192, 1)
        font.pixelSize: 12
    //  font.family: terminalvector.name
        x: 0; y: 1
    }

    Connections {
        target: Qt.QDesktopWidget.screenCountChanged
    }

    TextInput {
        id: cmd
        text: "Escribe aqui"
        focus: true
        color: Qt.rgba(192, 192, 192, 1)
        font.pixelSize: 12
      //  font.family: terminalvector.name
        x: 0; y: 52
    }
  }
}
