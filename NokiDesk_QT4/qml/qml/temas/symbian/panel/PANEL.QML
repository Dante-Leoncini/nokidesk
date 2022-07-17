import QtQuick 1.1
import com.nokia.symbian 1.1
import Qt.labs.folderlistmodel 1.0
import "componentCreation.js" as MyScript

Item {
    y: pantalto - 40
    StatusBar{y: -parent.y} //barra original

    signal abrirapp(string fileName, string archivo)

    onAbrirapp: {
                aplicaciones.append({
                     "programa" : fileName,
                     "nombre" : fileName,
                     "archivo" : archivo,
                     "app" : aplicaciones.count + 1,
                     "z" : aplicaciones.count + 1,
                     "x" : 0,
                     "y" : 0,
                     "ancho" : pantancho,
                     "alto" : pantalto,
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
        Image {
           source: "graficos/tarea.png"
           Image { //iconos dinamicos de la aplicacion
               x: 15; y: 4; z: 1
               source: "../../../aplicaciones/"+programa+"/32.png"
           }
           MouseArea { //abre el programa
               width: 62; height: 40; z:100
               onClicked: enfoca(index)
           }
        }
    }

    GridView { //Muestra los programas en la barra de tareas
        x: 59
        cellHeight: 40
        cellWidth: 62
        z: 20; width: pantancho; height: 40 
        model: aplicaciones
        delegate: tareas
    }



   Image {
       id: menuicon
       x: 8; y: 2; z: 3
       MouseArea {
            z: 200; width: parent.width; height: parent.height
            onClicked: {if (menu.state == "cerrado"){
                 menu.state = "abierto"}
          else {menu.state = "cerrado"};
        calendarios.state = "cerrado"
        volumen.state = "cerrado"
        bateria.state = "cerrado"
        wland.state = "cerrado"
        textra.state = "cerrado"
            }
       }
    }

Image {
    id: menu
    source: "graficos/menuc.png"
    z: 100; y: -height

    //Acceso a Carpetas
    Text {
    x: 250; y: 80
    color: "white"
    text: "root"
    font.pixelSize: 13
    font.family: segoeui.name
    MouseArea{
        width: parent.width; height: parent.height
        onClicked: {
            menu.state = "cerrado";
            abrirapp("Explorador", "file:///E:/Private/e097921d")
        }
    }}

    Text {
    x: 250; y: 120
    color: "white"
    text: "Imagenes"
    font.pixelSize: 13
    font.family: segoeui.name
    MouseArea{
        width: parent.width; height: parent.height
        onClicked: {
            menu.state = "cerrado";
            abrirapp("Explorador", "file:///E:/DCIM")
        }
    }}

    Text {
    x: 250; y: 160
    color: "white"
    text: "Musica"
    font.pixelSize: 13
    font.family: segoeui.name
    MouseArea{
        width: parent.width; height: parent.height
        onClicked: {
            menu.state = "cerrado";
            abrirapp("Explorador", "file:///E:/Music")
        }
    }}

    Text {
    x: 250; y: 200
    color: "white"
    text: "Videos"
    font.pixelSize: 13
    font.family: segoeui.name
    MouseArea{
        width: parent.width; height: parent.height
        onClicked: {
            menu.state = "cerrado";
            abrirapp("Explorador", "file:///E:/Videos")
        }
    }}

    Image {
        x: 248; y: 278
        source: "graficos/apagar.png"
        MouseArea {
            width: parent.width; height: parent.height
            onClicked: Qt.quit()
        }
    }
    state: "cerrado"
    states: [
        State {
            name: "abierto"
            PropertyChanges {target:menu; visible: true}
            PropertyChanges {target:menuicon; 
            source: "graficos/menu7_o.png";
            x:-1; y: -7}
        },
        State {
            name: "cerrado"
            PropertyChanges {target: menu; visible: false}
            PropertyChanges {target:menuicon; 
            source: "graficos/menu7.png";
            x: 8; y: 2}
        }
    ]


 Component { //Modelo de como se muestran los
                 //programas instalados en el menu
    id: menulist
    Rectangle {
        color: "white"
        height: 36; width: 228
        Image {
               y: 2
               source: "../../../aplicaciones/"+fileName+"/32.png"
        }
        Text { //Nombre del programa
            text: fileName
            font.pixelSize: 12
            x: 38; y: 12
        }
        MouseArea { //Abre el programa del menu
            width: parent.width
            height: parent.height; z:100
            onClicked: { 
                menu.state = "cerrado";
                abrirapp(fileName, null);
            }
        }
     }
 }

    ListView {
        x: 13; y: 13; width: 228; height: 225
        clip: true
        FolderListModel {
            id: instaladas
            folder: {source: "../../../aplicaciones/"}
        }

        model: instaladas
        delegate: menulist
    }
}


Image {
  source: "graficos/Inicio.png"
  Image {
    source: "graficos/barra.png"
    x: parent.width
    width: pantancho -95
  }
}
}