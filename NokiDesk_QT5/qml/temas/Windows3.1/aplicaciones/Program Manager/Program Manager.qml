import QtQuick 2.1
import Qt.labs.folderlistmodel 2.1
import "nd_ui.js" as Ui

Rectangle {
    id: programa
    color: "white"
    property int margen_right: 0
    property int margen_top: 0
    y: margen_top
    height: parent.height -margen_top
    width: parent.width -margen_right

    Component.onCompleted: {
      Ui.scrollBar(parent, listaprogram, Qt.Vertical) //crea la Barra de Scroll
      Ui.menu(parent) //Crea el Menu
    }

    Component { //Modelo de como se ven los programas en el menu
      id: menulist
          Item {
              Image {
                  source: "../../../../aplicaciones/"+fileName+"/32.png"
                  x: 22; y: 2
                  MouseArea { //Abre el programa del menu
                      width: parent.width
                      height: parent.height
                      onDoubleClicked: {
                        abrirapp(fileName, null, fileName, false);
                      }
                  }
               }

              Text {text: fileName
                   y: 37; width: 72; x: 2
                   horizontalAlignment: Text.AlignHCenter
                   font.pixelSize: 11
                   color: "black"
                   maximumLineCount: 2
                   wrapMode: Text.Wrap
              }
      }
   }

       GridView { //Muestra los programas instalados en la ventana
           id: listaprogram
           x: 4; y: 2; width: parent.width -8; height: parent.height -46
           cellHeight: 72
           cellWidth: 76
           clip: true
           FolderListModel {
               id: instaladas
               folder: {source: "../../../../aplicaciones/"}
           }
           model: instaladas
           delegate: menulist
       }
   }
