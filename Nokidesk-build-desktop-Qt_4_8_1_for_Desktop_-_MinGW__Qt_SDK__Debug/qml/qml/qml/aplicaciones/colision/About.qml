import Qt 4.7
import QtQuick 1.0
import "content/qcollision.js" as QcollJS
Rectangle {
    id: about
    anchors.fill: parent
    property string nextState: ""
    Image{
            id: background
            anchors.fill: parent
            source: "./pics/background.jpg"
            fillMode: Image.PreserveAspectCrop
    }
    MouseArea {
        anchors.fill: parent
        onClicked: QcollJS.load("qcollision");
    }

    Column {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Text {
            text: "Created by"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
        }

        Text {
            id: myname
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Mohit Kothari"
            color: "white"
            font.pointSize: 20
        }

        Text {
            text: "Based on Kollision"
            color: "white"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
        }

        Text {
            text: "mohitrajkothari@gmail.com"
            color: "white"
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
