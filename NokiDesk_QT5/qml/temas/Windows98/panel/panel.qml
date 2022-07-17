import QtQuick 2.1
import Qt.labs.folderlistmodel 2.1
import "componentCreation.js" as MyScript

Item {
id: panel

    y: pantalto - 28
    signal abrirapp(string fileName, string archivo)

    onAbrirapp: {
                aplicaciones.append({
                     "programa" : fileName,
                     "nombre" : fileName,
                     "archivo" : archivo,
                     "app" : aplicaciones.count + 1,
                     "z" : aplicaciones.count + 1,
                     "x" : 70,
                     "y" : 40,
                     "ancho" : 640,
                     "alto" : 480,
                     "maximizado" : false,
                     "minimizado" : true
                });
                MyScript.createSpriteObjects(fileName, aplicaciones.get(aplicaciones.count -1).app,
aplicaciones.get(aplicaciones.count -1).z,
aplicaciones.get(aplicaciones.count -1).nombre);
}


function escritorio() { //muestra el escritorio
  for (var i = 0; i < aplicaciones.count; i++){
      aplicaciones.setProperty(i, "minimizado", false)
  }
}

function cambioZ(x) { //Funcion que enfoca el programa
  //1: Muevo los programas que estaban adelante de x atras
  for (var i = 0; i < aplicaciones.count; i++){
    if (aplicaciones.get(x).z <= aplicaciones.get(i).z){
      aplicaciones.setProperty(i, "z", aplicaciones.get(i).z -1)
    } //Si el programa es mas grande que X se baja 1
  }

  //2: Enfoca el programa
  aplicaciones.setProperty(x, "z", aplicaciones.count);
}

function enfoca(x) { //Revisa que el programa este enfocado
  aplicaciones.setProperty(x, "minimizado", true)
        if (!(aplicaciones.get(x).z == aplicaciones.count))
            {cambioZ(x)};
}

   height: 40
   FontLoader {
       id: segoeui
       source: "../../../fuentes/segoeui.ttf"
   }

    Component { //vista de la barra de tareas
        id: tareas
        BorderImage {
           width: 160; height: 22
           source: "graficos/tarea.png"
           border { left: 2; top: 2; right: 2; bottom: 2 }
           horizontalTileMode: BorderImage.Repeat
           verticalTileMode: BorderImage.Stretch
           smooth: false

           Image { //iconos dinamicos de la aplicacion
               x: 4; y: 4; z: 1
               source: "../../../aplicaciones/"+programa+"/16.png"
           }
           MouseArea { //abre el programa
               width: 62; height: 40; z:100
               onClicked: enfoca(index)
           }
           Text {
               text: programa;
               y: 3; x: 23
               font.pixelSize: 12
               font.family: segoeui.name
               color: "black"
           }
        }
    }

    GridView { //Muestra los programas en la barra de tareas
        x: 106-38
        y: 4
        cellHeight: 40
        cellWidth: 25
        z: 20; width: pantancho; height: 40 
        model: aplicaciones
        delegate: tareas
    }

Item {
   id: tiempo
   x: pantancho -39; z: 5

   Timer {interval: 1000; running: true; repeat: true
            onTriggered: time.text = Qt.formatDateTime(new Date(), "hh:mm");}

   Text {
       id: time
       text: Qt.formatDateTime(new Date(), "hh:mm");
       y: 7
       font.pixelSize: 12
       font.family: segoeui.name
       color: "black"
       anchors {horizontalCenter: parent.horizontalCenter}
   }
}

Image {
  source: "graficos/Inicio.png"
  Image {
    source: "graficos/barra.png"
    x: parent.width
    width: pantancho -104 -67
    Image {
      source: "graficos/oscuro.png"
      x: parent.width
    }
  }
}

    Component.onCompleted: {
        forceActiveFocus();
        abrirapp("Worms", "");
    }
}
