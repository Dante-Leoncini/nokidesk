import QtQuick 2.1
import "ejecutar.js" as Nd

Item {
    id: panel

    function icopropio(propio,programa,tema) {
        if (propio){return "../aplicaciones/"+programa+"/32.png"}
        else {return "../../../aplicaciones/"+programa+"/32.png"}
    }

    Component { //vista de los programas minimizados
        id: minimizados
        Item {
            width: 76; height: 75
            Image { //iconos de la aplicacion
                y: 4
                anchors.horizontalCenter: parent.horizontalCenter
                source: icopropio(propio,programa)
            }
            Text{
                text: programa
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: "black"
                font.pixelSize: 12
                y: 40
                maximumLineCount: 2
                wrapMode: Text.Wrap

            }
            MouseArea { //maximiza el programa y lo quita de la lista
                anchors.fill: parent
                onClicked: enfoca(index)
            }
        }
    }

    GridView { //Muestra los programas en la barra de tareas
        x: 0; y: pantalto -height
        interactive: false
        cellHeight: 75
        cellWidth: 76
        width: pantancho; height: 75
        model: aplicaciones
        delegate: minimizados
    }

    Component.onCompleted: {        
        forceActiveFocus()
        parent.z = 1
        //abrirapp("Worms", null, "", true);
    }

    //focus: true
    //Keys.onSpacePressed: abrirapp("Worms", null, "", true);

    Timer {interval: 100; running: true; repeat: false
             onTriggered: abrirapp("Program Manager", null, "Program Manager", true)
    }

    signal abrirapp(string fileName, string fichero, string nombre, bool propio)

    signal cerrar_Panel()
    onCerrar_Panel: {panel.destroy()}

    onAbrirapp: {
                aplicaciones.append({
                     "programa" : fileName,
                     "nombre" : nombre,
                     "fichero" : fichero,
                     "app" : aplicaciones.count + 1,
                     "z" : aplicaciones.count + 1,
                     "x" : 70,
                     "y" : 40,
                     "ancho" : 540,
                     "alto" : 380,
                     "maximizado" : false,
                     "minimizado" : true,
                     "propio" : propio
                });
                Nd.aplicacion(fileName,
                              aplicaciones.get(aplicaciones.count -1).app,
                              aplicaciones.get(aplicaciones.count -1).z,
                              aplicaciones.get(aplicaciones.count -1).nombre,
                              aplicaciones.get(aplicaciones.count -1).fichero,
                              aplicaciones.get(aplicaciones.count -1).propio);
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

   FontLoader {
       id: segoeui
       source: "../../../fuentes/segoeui.ttf"
   }
}
