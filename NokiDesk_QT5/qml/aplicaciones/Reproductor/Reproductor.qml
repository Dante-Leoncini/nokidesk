import QtQuick 2.1
import QtMultimedia 5.0

Rectangle {
    color: "black"
    anchors.fill: parent

    function playb(){
        if (player.playbackState === 1){
            player.pause()}
        else {player.play()}
    }

    MediaPlayer {
        id: player
        source: fichero
        autoPlay: true
    }

    VideoOutput {
        id: videoOutput
        source: player
        anchors.fill: parent
    }

   /* Rectangle { //Barra de reproduccion
        color: "white"
        y: parent.height -height
        width: parent.width
        height: 50

        Rectangle { //Boton Play
            color: "red"
            width: 30
            height: 30*/
            MouseArea {
                anchors.fill: parent
                onClicked: playb()
            }
       // }
    //}

    Component.onCompleted: {
    }
}
