import QtQuick 1.0
import "content"
import "content/qcollision.js" as QcollJS

Rectangle {
        id: screen
        x: 8; y: 30
        width: maxi(2) -16
        height: parent.parent.height -38
        color: "#282828"
        clip: true

   SystemPalette{id: activePalette}

   Item{
      width: parent.width
      anchors{top: parent.top;bottom: toolBar.top}

      Image{ 
         id: background
         anchors.fill: parent
         source: "./pics/background.jpg"
         fillMode: Image.PreserveAspectCrop
      }
      Item{
         id: gameCanvas
         property int score: 0
         property int blockSize: 40

         anchors.centerIn: parent
         width: parent.width -(parent.width % blockSize);
         height: parent.height - (parent.height % blockSize);
      }
   }
   Rectangle{
      id:toolBar
      width: parent.width; height:30
      color: activePalette.window
      anchors.bottom: screen.bottom

      Text{
                        id:score
         anchors{right: parent.right; verticalCenter: parent.verticalCenter}
         text: "Score: Who Knows"
      }
                Button {
                            id: newGameButton
                            anchors { left: parent.left; leftMargin: 3; verticalCenter: parent.verticalCenter }
                            text: "Easy"
                            onClicked: {QcollJS.startNewGame(2)}
                }
                Button {
                            id: newGameButton1
                            anchors { left: parent.left; leftMargin: 60; verticalCenter: parent.verticalCenter }
                            text: "Medium"
                            onClicked: {QcollJS.startNewGame(3)}
                }
                Button {
                            id: newGameButton2
                            anchors { left: parent.left; leftMargin: 140; verticalCenter: parent.verticalCenter }
                            text: "Hard"
                            onClicked: {QcollJS.startNewGame(4)}
                }
                Button {
                            id: newGameButton3
                            anchors { left: parent.left; leftMargin: 220; verticalCenter: parent.verticalCenter }
                            text: "Quit"
                            onClicked: {Qt.quit()}
                }
                Button {
                            id: newGameButton4
                            anchors { left: parent.left; leftMargin: 300; verticalCenter: parent.verticalCenter }
                            text: "About"
                            onClicked: {QcollJS.load("About")}
                }
   }
        Timer{
            id:update_timer
            interval: 16; running: false; repeat: true;
            onTriggered: QcollJS.update();
        }

}

