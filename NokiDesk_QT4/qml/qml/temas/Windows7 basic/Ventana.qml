import QtQuick 1.1

Item {
    function enfocado(n, x, y) {
        if (n == 1 && x == y)
            {return "ventana/Borde.png"}
        else if (n == 1)
            {return "ventana/Borde_i.png"}

        else if (n == 2 && x == y)
            {return "ventana/c.png"}
        else if (n == 2)
            {return "ventana/ci.png"}

        else if (n == 3 && x == y)
            {return "ventana/M.png"}
        else if (n == 3)
            {return "ventana/M_i.png"}

        else if (n == 4 && x == y)
            {return "ventana/mi.png"}
        else
            {return "ventana/mi_i.png"};
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

function maxi(x){
      if (x == 1 && aplicaciones.get(cerrar(indice)-1).maximizado == false && virtualkb == false) {return aplicaciones.get(cerrar(indice)-1).alto}

else if (x == 1 && virtualkb == true) {
         if (pantalto == 640){return 371}
         else {return 203}
    }

else if (x == 1) {return pantalto -24}

else if (x == 2 && aplicaciones.get(cerrar(indice)-1).maximizado == false && virtualkb == false) {return aplicaciones.get(cerrar(indice)-1).ancho}

else if (x == 2) {return pantancho +16}

else if (x == 3 && aplicaciones.get(cerrar(indice)-1).maximizado == true
|| x == 3 && virtualkb == true
//|| x == 3 && !(deviceinfo.isWirelessKeyboardConnected)
) {return -8}

else if (x == 3) {return aplicaciones.get(cerrar(indice)-1).x}

else if (x == 4 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return -8}

else if (x == 4 && virtualkb == true
) {return -30}

else if (x == 4) {return aplicaciones.get(cerrar(indice)-1).y}

else if (x == 5 && aplicaciones.get(cerrar(indice)-1).maximizado == false && virtualkb == false
) {return true}

else if (x == 5
) {return false}
}

function maximizar(x){
if (aplicaciones.get(cerrar(x)-1).maximizado == false) {
aplicaciones.setProperty(cerrar(x)-1, "maximizado", true)}
else {aplicaciones.setProperty(cerrar(x)-1, "maximizado", false)}
}

function activo(x) {
        if (x == aplicaciones.count -1)
            {return false}
        else {return true}
    }

function ordenar(x){
  for (var i = 0; i < aplicaciones.count; i++){
    if (aplicaciones.get(cerrar(x)-1).z <= aplicaciones.get(i).z){
      aplicaciones.setProperty(i, "z", aplicaciones.get(i).z -1)
    } //Si el programa es mas grande que X se baja 1
  }
  aplicaciones.remove(cerrar(x)-1)
}

function cerrar(x) {
    for (var i = 0; i < aplicaciones.count; i++){
      if (aplicaciones.get(i).app == x){
      return i + 1};   
    };
}

    property string indice: ""
    width: maxi(2); height: maxi(1)
    x: maxi(3); y: maxi(4)
    z: aplicaciones.get(cerrar(indice)-1).z
    property string programa: ""
    property string nombre: ""
    property string otro: ""
    property string fichero: ""
    property bool virtualkb: false
    id: anima
    visible: aplicaciones.get(cerrar(indice)-1).minimizado

    //contenedor del program
    Loader { x: 8; y: 30; height: parent.height -38; id: carga; width: maxi(2) -16
        source: "../../aplicaciones/"+programa+"/"+programa+".qml"
        clip: true
    }

    Image {
        x: 10; y: 10; z: 1
        source: "../../aplicaciones/"+programa+"/16.png"
   }

        Text {
            x: 30; y: 11; z: 10
            clip: true
            width: maxi(2) -30 -107
            text: aplicaciones.get(cerrar(indice)-1).nombre
//"x: " + aplicaciones.get(cerrar(indice)-1).x + " y: " + aplicaciones.get(cerrar(indice)-1).y
//"alto: " + aplicaciones.get(cerrar(indice)-1).alto + " pantalto: " + pantalto + " maximizado: " + aplicaciones.get(cerrar(indice)-1).maximizado
//nombre+" id: "+ cerrar(indice) + " z: " + aplicaciones.get(cerrar(indice)-1).minimizado + " realz: " + parent.z
            color: "black"
            font.pixelSize: 12 
        }

    MouseArea {
        enabled: false
        width: parent.width; height: parent.height; z:200
        onClicked: cambioZ(cerrar(indice)-1)
    }

    BorderImage {
          width: maxi(2); height: parent.height
          border { left: 8; top: 30; right: 8; bottom: 8 }
          horizontalTileMode: BorderImage.Stretch
          verticalTileMode: BorderImage.Stretch
          source: enfocado(1,parent.z, aplicaciones.count)

ParallelAnimation {
    id: playh
    running: false
    NumberAnimation {target: anima; properties: "scale"; to: 0.8; duration: 150}
    NumberAnimation {target: anima; properties: "opacity"; to: 0.0; duration: 150}
}


ParallelAnimation {
    id: playa
    running: true
    NumberAnimation {target: anima; properties: "scale"; from: 0.8; to: 1.0; duration: 300}
    NumberAnimation {target: anima; properties: "opacity"; from: 0.0; to: 1.0; duration: 300}
}

          Image { //Cerrar Aplicacion
             x: parent.width -40; y: 10; z: parent.z + 1
             source: enfocado(2,parent.parent.z, aplicaciones.count)
             MouseArea {
                height: parent.height; width: parent.width
                z: 100
                onClicked: {
                    //playh.start()
                    ordenar(indice)
                    parent.parent.parent.destroy()
                }
             }
          }
        Image { //Maximizar Aplicacion
             x: parent.width -74; y: 10; z: parent.z + 1
             source: enfocado(3,parent.parent.z, aplicaciones.count)
             MouseArea {
                height: parent.height; width: parent.width
                z: 100
                onClicked: {
                    maximizar(indice)}
             }
        }
        Image { //Minimizar
             x: parent.width -107; y: 10; z: parent.z + 1
             source: enfocado(4,parent.parent.z, aplicaciones.count)
             MouseArea {
                height: parent.height; width: parent.width
                z: 100
                onClicked: {
                aplicaciones.setProperty(cerrar(indice-1), "minimizado", false)}
             }
        }
        MouseArea { //Mover ventana
            height: 30; width: parent.width
            enabled: maxi(5)
            //onPressed: {maximizar(indice)}
            drag.target: parent.parent
            drag.axis: Drag.XandYAxis
            onReleased: {
        aplicaciones.setProperty(cerrar(indice)-1, "x", parent.parent.x)
        aplicaciones.setProperty(cerrar(indice)-1, "y", parent.parent.y)
            }
         }

        MouseArea { //Cambiar ancho de ventana
          height: parent.height; width: 8
          enabled: maxi(5)
          x: parent.width -8
          onPositionChanged: {
            pancho = parent.width +  mouseX
       if (pancho > 200){
           aplicaciones.setProperty(cerrar(indice)-1, "ancho", pancho)}
       else {aplicaciones.setProperty(cerrar(indice)-1, "ancho", 200)}
           }
        }

        MouseArea { //Cambiar alto de ventana
          height: 8; width: parent.width
          enabled: maxi(5)
          y: parent.height -8
          onPositionChanged: {
            palto = parent.height + mouseY
       if (palto > 200){
              aplicaciones.setProperty(cerrar(indice)-1, "alto", palto)}
       else {aplicaciones.setProperty(cerrar(indice)-1, "alto", 200)}
           }
        }
      }
    }
