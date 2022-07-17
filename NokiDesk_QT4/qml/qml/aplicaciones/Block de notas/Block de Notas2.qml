import QtQuick 1.1
import FileIO 1.0
import "content"

 Item { //Block de notas de windows7

        BorderImage {
            width: parent.width
            height: 20
            border { left: 1; top: 1; right: 1; bottom: 1 }
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "Menu.png"  

            MouseArea {
                width: parent.width
                height: parent.height
                onClicked: myFile.write(textInput.text);
            }
 
            Text {
                x: 7; y: 5
                text: "Archivo"
                color: "black"
                font.pixelSize: 9 
            } 
       }

    FileIO {
        id: myFile
        source: aplicaciones.get(cerrar(indice)-1).archivo
    }

        BorderImage {
            y: 20; width: parent.width
            height: parent.height -20
            border { left: 2; top: 2; right: 2; bottom: 2 }
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "block.png"
            clip: true

              BorderImage {
                x: parent.width - 19; width: 18; y: 2
                height: parent.height -4
                border { left: 1; top: 12; right: 1; bottom: 11 }
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode: BorderImage.Stretch
                source: "SCROLL.png"

    //barra de scroll
    ScrollBar {
        scrollArea: textInput; width: 12
        height: parent.height -20
        y: 10
        orientation: Qt.Vertical
    }
}

        TextEdit {
            id: textInput
            width: parent.width - 18
            height: parent.height
            text: myFile.read();
            font.pixelSize: 12
            wrapMode: Text.Wrap
            activeFocusOnPress: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (!textInput.activeFocus) {
                        textInput.forceActiveFocus();
                        //if (false == isWirelessKeyboardConnected()){
                            textInput.openSoftwareInputPanel();
                        //}
                    } else {
                        textInput.focus = false;
                    }
                }
                onPressAndHold: textInput.closeSoftwareInputPanel();
            }
         }
    }
}
