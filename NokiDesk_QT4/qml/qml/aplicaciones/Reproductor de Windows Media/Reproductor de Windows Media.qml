import QtQuick 1.1
import QtMultimediaKit 1.1

Item { //Block de notas de windows7
  x: 8; y: 30; width: maxi(2) -16
  height: parent.parent.height -38
  Rectangle {
    width: parent.width; height: parent.height
    color: "black"
  }
  Video {
    id: video
    width: parent.width
    height: parent.height
    source: "Big Buck Bunny.mp4"
//"video.mp4"

    MouseArea {
      anchors.fill: parent
      onClicked: {
        video.play()
      }
    }

    focus: true
    Keys.onSpacePressed: video.paused = !video.paused
    Keys.onLeftPressed: video.position -= 5000
    Keys.onRightPressed: video.position += 5000
  }
}
