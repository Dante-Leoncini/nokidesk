import QtQuick 1.1
import Qt.labs.folderlistmodel 1.0
import "componentCreation.js" as MyScript

Item {

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

Item {
   id: tiempo
   x: pantancho -58; z: 5

   Timer {interval: 1000; running: true; repeat: true
            onTriggered: time.text = Qt.formatDateTime(new Date(), "hh:mm a");}

   Timer {interval: 60000; running: true; repeat: true
            onTriggered: calendario.text = Qt.formatDateTime(new Date(), "dd/MM/yyyy")}

   Timer {interval: 500; running: true; repeat: true
            onTriggered: cal.text = Qt.formatDateTime(new Date(), "hh:mm:ss a")}

   Text {
       id: time
       text: Qt.formatDateTime(new Date(), "hh:mm a");
       y: 5
       font.pixelSize: 13
       font.family: segoeui.name
       color: "white"
       anchors {horizontalCenter: parent.horizontalCenter}
   }

   Text {
       id: calendario
       font.pixelSize: 13
       font.family: segoeui.name
       text: calendario.text = Qt.formatDateTime(new Date(), "dd/MM/yyyy")
       color: "white"
       horizontalAlignment: AlignHCenter
       anchors {
           top: time.bottom
           topMargin: -1
           horizontalCenter: parent.horizontalCenter
       }
   }
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
                aplicaciones.append({
                     "programa" : fileName,
                     "nombre" : fileName,
                     "archivo" : null,
                     "app" : aplicaciones.count + 1,
                     "z" : aplicaciones.count + 1,
                     "x" : 0,
                     "y" : 0,
                     "ancho" : 300,
                     "alto" : 300,
                     "maximizado" : false,
                     "minimizado" : true
                });
                MyScript.createSpriteObjects(fileName, aplicaciones.get(aplicaciones.count -1).app,
aplicaciones.get(aplicaciones.count -1).z,
aplicaciones.get(aplicaciones.count -1).nombre);
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

function wnivel(x){
      if (x == 1 && wlaninfo.networkSignalStrength > 80) {
          return "graficos/wifi_5.png"}
else if (x == 1 && wlaninfo.networkSignalStrength > 60) {
         return "graficos/wifi_4.png"}
else if (x == 1 && wlaninfo.networkSignalStrength > 40) {
         return "graficos/wifi_3.png"}
else if (x == 1 && wlaninfo.networkSignalStrength > 20) {
         return "graficos/wifi_2.png"}
else if (x == 1 && wlaninfo.networkSignalStrength > 0) {
         return "graficos/wifi_1.png"}

else if (x == 2 && wlaninfo.networkSignalStrength > 80) {
          return "graficos/wifi_100.png"}
else if (x == 2 && wlaninfo.networkSignalStrength > 60) {
         return "graficos/wifi_100.png"}
else if (x == 2 && wlaninfo.networkSignalStrength > 40) {
         return "graficos/wifi_100.png"}
else if (x == 2 && wlaninfo.networkSignalStrength > 20) {
         return "graficos/wifi_100.png"}
else if (x == 2 && wlaninfo.networkSignalStrength > 0) {
         return "graficos/wifi_100.png"}
}

function bnivel(x){
      if (x == 1 && deviceinfo.batteryLevel > 90) {
          return 9}
else if (x == 1 && deviceinfo.batteryLevel > 80) {
         return 8}
else if (x == 1 && deviceinfo.batteryLevel > 70) {
         return 7}
else if (x == 1 && deviceinfo.batteryLevel > 60) {
         return 6}
else if (x == 1 && deviceinfo.batteryLevel > 50) {
         return 5}
else if (x == 1 && deviceinfo.batteryLevel > 40) {
         return 4}
else if (x == 1 && deviceinfo.batteryLevel > 30) {
         return 3}
else if (x == 1 && deviceinfo.batteryLevel > 20) {
         return 2}
else if (x == 1 && deviceinfo.batteryLevel > 10) {
         return 1}
else if (x == 1 && deviceinfo.batteryLevel > 0) {
         return 0}

else if (x == 2 && deviceinfo.batteryLevel > 90) {
         return 5}
else if (x == 2 && deviceinfo.batteryLevel > 80) {
         return 6}
else if (x == 2 && deviceinfo.batteryLevel > 70) {
         return 7}
else if (x == 2 && deviceinfo.batteryLevel > 60) {
         return 8}
else if (x == 2 && deviceinfo.batteryLevel > 50) {
         return 9}
else if (x == 2 && deviceinfo.batteryLevel > 40) {
         return 10}
else if (x == 2 && deviceinfo.batteryLevel > 30) {
         return 11}
else if (x == 2 && deviceinfo.batteryLevel > 20) {
         return 12}
else if (x == 2 && deviceinfo.batteryLevel > 10) {
         return 13}

else if (x == 3 && deviceinfo.batteryLevel > 10) {
         return "graficos/bateria.png"}
else if (x == 3 && deviceinfo.batteryLevel > 7) {
         return "graficos/bateria_advertencia.png"}
else if (x == 3 && deviceinfo.batteryLevel > 0) {
         return "graficos/bateria_critica.png"}
}

Image {
  source: "graficos/Inicio.png"
  Image {
    source: "graficos/barra.png"
    x: parent.width
    width: pantancho -39 - 214 - 15 -95
    Image {
      source: "graficos/transicion.png"
      x: parent.width
    }
  }
}
Image {
  source: "graficos/oscuro.png"
  width: 214
  x: pantancho - 214 - 15
  Image { //Volumen
    source: "graficos/volumen_0.png"
    x: 106; y: 12
  }
  Image { //Bateria
    source: "graficos/bateria.png"
    x: 83; y: 12
    Rectangle {
      width: 5; height: bnivel(1); x: 7; y: bnivel(2)
      color: "white"
    }
  }
  Image { //Wifi
    source: wnivel(2)
    x: 60; y: 12
  }
  Image { //Flecha
    id: bextra
    source: "graficos/flecha_off.png"
    x: 34; y: 11
  }
  Text {
    x: 13; y: 10
    text: "ES"
    font.pixelSize: 13
    font.family: segoeui.name
    color: "white"
  }
  Image {
    source: "graficos/escritorio.png"
    x: parent.width
  }
}

//Botones
    MouseArea { //wifi
         width: 22; height: 22
         x: pantancho -171; z: 100; y: 10
         onClicked: {if (wland.state == "cerrado")
                          {wland.state = "abierto"}
                    else {wland.state = "cerrado"};
        calendarios.state = "cerrado"
        volumen.state = "cerrado"
        bateria.state = "cerrado"
        textra.state = "cerrado"
        menu.state = "cerrado"
         }
    }
    MouseArea { //bateria
         width: 22; height: 22
         x: pantancho -151; z: 100; y: 10
         onClicked: {if (bateria.state == "cerrado")
                          {bateria.state = "abierto"}
                    else {bateria.state = "cerrado"};
        calendarios.state = "cerrado"
        volumen.state = "cerrado"
        textra.state = "cerrado"
        wland.state = "cerrado"
        menu.state = "cerrado"
         }
    }
    MouseArea { //volumen
         width: 22; height: 22
         x: pantancho -127; z: 100; y: 10
         onClicked: {if (volumen.state == "cerrado")
                          {volumen.state = "abierto"}
                    else {volumen.state = "cerrado"};
        calendarios.state = "cerrado"
        textra.state = "cerrado"
        bateria.state = "cerrado"
        wland.state = "cerrado"
        menu.state = "cerrado"
         }
    }
    MouseArea { //calendario
         width: 74; height: 38
         x: pantancho -97; z: 100; y: 2
         onClicked: {if (calendarios.state == "cerrado")
                          {calendarios.state = "abierto"}
                    else {calendarios.state = "cerrado"};
        textra.state = "cerrado"
        volumen.state = "cerrado"
        bateria.state = "cerrado"
        wland.state = "cerrado"
        menu.state = "cerrado"
         }
    }
    MouseArea { //escritorio
         width: 15; height: 40
         x: pantancho -15; z: 100
         onClicked: escritorio()
    }
    MouseArea { //mostrar mas
         width: 21; height: 20
         x: pantancho -195; z: 100; y: 11
         onClicked: {if (textra.state == "cerrado")
                          {textra.state = "abierto"}
                    else {textra.state = "cerrado"};
        calendarios.state = "cerrado"
        volumen.state = "cerrado"
        bateria.state = "cerrado"
        wland.state = "cerrado"
        menu.state = "cerrado"
         }
    }

//Dialogos del menu

    BorderImage { //Bateria
        id: bateria
        x: pantancho -width -3; y: -height
        width: 262; height: 174
        border { left: 1; top: 1; right: 1; bottom: 1 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "graficos/dialogo.png"
        Image {
          source: "graficos/dialogo_inf.png"
          width: parent.width -2
          x: 1; y: 130
        }
        Image {
          source: "graficos/B_cargando.png"
          x: 19; y: 10
        }
        Image {
          source: "graficos/redonda_si.png"
          x: 22; y: 82
        }
        Image {
          source: "graficos/redonda_no.png"
          x: 22; y: 104
        }
        Rectangle {
          width: parent.width -2; height: 1
          x: 1; y: 52
          color: "#f1f5fb"
        }
        Rectangle {
          width: parent.width -2; height: 38
          x: 1; y: 135
          color: "#f1f5fb"
        }
        Text {
          x: 62; y: 10
          text: "Queda " + deviceinfo.batteryLevel + "%"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "black"
        }
        Text {
          x: 18; y: 56
          text: "Seleccione un plan de energia:"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#575757"
        }
        Text {
          x: 38; y: 80
          text: "Equilibrado"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "black"
        }
        Text {
          x: 38; y: 102
          text: "Economizador"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "black"
        }
        Text {
          x: 66; y: 148
          text: "Mas opciones de energia"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        state: "cerrado"
        states: [
            State {
                name: "abierto"
                PropertyChanges {target:bateria; visible: true}
            },
            State {
                name: "cerrado"
               PropertyChanges {target: bateria; visible: false}
            }
        ]
    }


    BorderImage { //Volumen
        id: volumen
        x: pantancho -width -81; y: -height
        width: 70; height: 291
        border { left: 1; top: 1; right: 1; bottom: 1 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "graficos/dialogo.png"
        Image {
          source: "graficos/dialogo_inf.png"
          width: parent.width -2
          x: 1; y: 247
        }
        Image {
          source: "graficos/volumen_ico.png"
          x: 19; y: 16
        }
        Image {
          source: "graficos/volumen_medidor.png"
          x: 24; y: 69
        }
        Image {
          source: "graficos/volumen_off.png"
          x: 27; y: 207
        }
        Rectangle { //Color fondo
          width: parent.width -2; height: 38
          x: 1; y: 252
          color: "#f1f5fb"
        }
        Text {
          x: 8; y: 264
          text: "Mezclador"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        state: "cerrado"
        states: [
            State {
                name: "abierto"
                PropertyChanges {target:volumen; visible: true}
            },
            State {
                name: "cerrado"
               PropertyChanges {target: volumen; visible: false}
            }
        ]
    }

    BorderImage { //Calendario
        id: calendarios
        x: pantancho -width; y: -height
        width: 331; height: 249
        border { left: 1; top: 1; right: 1; bottom: 1}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "graficos/dialogo.png"
        Image {
          source: "graficos/dialogo_inf.png"
          width: parent.width -2
          x: 1; y: 205
        }
        Image {
          source: "graficos/flecha.png"
          x: 20; y: 55
        }
        Image {
          source: "graficos/flecha.png"
          mirror: true
          x: 167; y: 55
        }
        Image {
          source: "graficos/volumen_off.png"
          x: 27; y: 207
        }
        Rectangle { //Color fondo
          width: parent.width -2; height: 38
          x: 1; y: 210
          color: "#f1f5fb"
        }
        Text {
          x: 24; y: 55; width: 143
          horizontalAlignment: Text.AlignHCenter
          text: Qt.formatDateTime(new Date(), "MMMM")+ " de "
              + Qt.formatDateTime(new Date(), "yyyy")
          font.pixelSize: 12
          font.family: segoeui.name
        }
        Text {
          id: cal
          x: 187; y: 181; width: 125
          horizontalAlignment: Text.AlignHCenter
          font.pixelSize: 12
          text: Qt.formatDateTime(new Date(), "hh:mm:ss a")
          font.family: segoeui.name
        }
        Text {
          y: 18; width: parent.width
          horizontalAlignment: Text.AlignHCenter
          text: Qt.formatDateTime(new Date(), "dddd, dd") + " de "                 + Qt.formatDateTime(new Date(), "MMMM") + " de "                    + Qt.formatDateTime(new Date(), "yyyy")
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        Text {
          x: 53; y: 222
          text: "Cambiar la configuracion de fecha y hora..."
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        state: "cerrado"
        states: [
            State {
                name: "abierto"
                PropertyChanges {target: calendarios; visible: true}
            },
            State {
                name: "cerrado"
               PropertyChanges {target: calendarios; visible: false}
            }
        ]
    }

    BorderImage { //Wifi menu
        id: wland
        x: pantancho -width -31; y: -height
        width: 266; height: 320
        border { left: 1; top: 1; right: 1; bottom: 1}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "graficos/dialogo.png"
        Image {
          source: "graficos/dialogo_inf.png"
          width: parent.width -2
          x: 1; y: parent.height -41
        }
        Image {
          source: "graficos/refrescar.png"
          x: 242; y: 7
        }
        Image {
          source: "graficos/wf2.png"
          x: 242; y: 83
        }
        Image {
          source: "graficos/hogar.png"
          x: 11; y: 36
        }
        Image {
          source: wnivel(1)
          x: 231; y: 107
        }
        Rectangle { //Color fondo
          width: parent.width -2; height: 35
          x: 1; y: parent.height -height -1
          color: "#f1f5fb"
        }
        Rectangle {
          width: parent.width -2; height: 1
          x: 1; y: 74
          color: "#f1f5fb"
        }
        Text {
          x: 13; y: 9
          text: "Conectado actualmente a:"
          font.pixelSize: 12
          font.family: segoeui.name
        }
        Text {
          x: 51; y: 34
          font.pixelSize: 12
          font.weight: font.Bold
          text: wlaninfo.networkName
          font.family: segoeui.name
        }
        Text {
          x: 51; y: 49
          font.pixelSize: 12
          text: "Acceso a Internet"
          font.family: segoeui.name
        }
        Text {
          x: 10; y: 82
          text: "Conexion de red inalambrica"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#575757"
        }
        Text {
          y: 112; x: 12
          font.weight: font.Bold
          text: wlaninfo.networkName
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        Text {
          y: 112; x: 164
          font.weight: font.Bold
          text: "Conectado"
          font.pixelSize: 12
          font.family: segoeui.name
        }
        Text {
          y: parent.height -30; width: parent.width
          horizontalAlignment: Text.AlignHCenter
          text: "Abrir Centro de redes y recursos compartidos"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        state: "cerrado"
        states: [
            State {
                name: "abierto"
                PropertyChanges {target: wland; visible: true}
            },
            State {
                name: "cerrado"
               PropertyChanges {target: wland; visible: false}
            }
        ]
    }

    BorderImage { //Mas botones de la barra
        id: textra
        x: pantancho -width -178; y: -height
        width: 106; height: 91
        border { left: 1; top: 1; right: 1; bottom: 1}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "graficos/dialogo.png"
        Rectangle { //Color fondo
          width: parent.width -2; height: 35
          x: 1; y: parent.height -height -1
          color: "#f1f5fb"
        }
        UniversalIndicators {
            id: idctr; z: 105; x: 32; y: 16
            height: 18
            width: 18*6
            indicatorColor: "red"
            indicatorWidth: 18
            indicatorHeight: 18
            indicatorPadding: 1
            maxIndicatorCount: 6
        }
        Text {
          y: parent.height -30; width: parent.width
          horizontalAlignment: Text.AlignHCenter
          text: "Personalizar"
          font.pixelSize: 12
          font.family: segoeui.name
          color: "#0066db"
        }
        state: "cerrado"
        states: [
            State {
                name: "abierto"
                PropertyChanges {target: textra; visible: true}
       PropertyChanges {target: bextra; source: "graficos/flecha_on.png"}
            },
            State {
                name: "cerrado"
               PropertyChanges {target: textra; visible: false}
    PropertyChanges {target: bextra; source: "graficos/flecha_off.png"}
            }
        ]
    }


}
