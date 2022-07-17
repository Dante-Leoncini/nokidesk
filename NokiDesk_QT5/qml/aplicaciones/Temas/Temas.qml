import QtQuick 2.1
import Qt.labs.folderlistmodel 2.1

Rectangle {
    anchors.fill: parent
    color: "black"
    signal cambio(string tema)

    Text {
        text: "Tema Actual: "+ root.tema
        color: "white"
        x: 5; y: 5
    }

    onCambio: {
        cerrar_Panel()
        root.tema = tema
        crearPanel(tema)
        ordenar(indice)
        parent.parent.destroy()
    }

    Component { //Modelo de como se ven los Temas
       id: temaslista
       Item {height: 50; width: parent.width
       Rectangle { //Contenedor
           color: "white"
           height: 40; width: parent.width

           Text {
               text: fileName
           }

       MouseArea {
               anchors.fill: parent
               onClicked: cambio(fileName);
           }
        }
      }
    }

       ListView {
           x: 10; y: 40
           width: parent.width-20
           height: parent.height-40
           clip: true
           FolderListModel {
               id: carpetaTemas
               folder: {source: "../../temas/"}
           }
           model: carpetaTemas
           delegate: temaslista
       }
}
