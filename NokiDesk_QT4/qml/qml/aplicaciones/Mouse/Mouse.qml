import QtQuick 1.1
import MouseD 1.0

Rectangle {
  color: "red"
  width: parent.parent.width
  height: parent.parent.height

  //Muestra el Mouse Oculto
  Component.onCompleted: raton.visible = true
  Component.onDestruction: raton.visible = false

  Text {
      text: "p"//MouseD.GlobalCursorPos()()
      x: 30; y: 30
  }

  MouseArea {
     width: parent.width; height: parent.height; z:100
     //onClicked: enfoca(index)
     drag.target: raton
     drag.axis: Drag.XandYAxis
     onReleased: MouseD.posicion()
     onClicked: {mouseX = raton.x
                        mouseY = raton.y}
 }
}
