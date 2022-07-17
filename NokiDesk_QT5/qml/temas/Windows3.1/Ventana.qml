import QtQuick 2.1

Item {
    function enfocado(n, x, y) {
        if (n == 1 && x == y)
            {return "ventana/Borde.png"}
        else if (n == 1)
            {return "ventana/Borde_i.png"}

        if (n == 2 && x == y)
            {return "white"}
        else if (n == 2)
            {return "black"}

        else if (n == 3 && aplicaciones.get(cerrar(indice)-1).maximizado == false)
            {return "ventana/M.png"}
        else if (n == 3)
            {return "ventana/MM.png"};
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

else if (x == 1) {return pantalto +8}

else if (x == 2 && aplicaciones.get(cerrar(indice)-1).maximizado == false && virtualkb == false) {return aplicaciones.get(cerrar(indice)-1).ancho}

else if (x == 2) {return pantancho +8}

else if (x == 3 && aplicaciones.get(cerrar(indice)-1).maximizado == true
|| x == 3 && virtualkb == true
//|| x == 3 && !(deviceinfo.isWirelessKeyboardConnected)
) {return -4}

else if (x == 3) {return aplicaciones.get(cerrar(indice)-1).x}

else if (x == 4 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return -4}

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

function rpropio(propio,programa) {
    if (propio){return "aplicaciones/"+programa+"/"+programa+".qml"}
    else {return "../../aplicaciones/"+programa+"/"+programa+".qml"}
}

    property string indice: ""
    width: maxi(2); height: maxi(1)
    x: maxi(3); y: maxi(4)
    z: aplicaciones.get(cerrar(indice)-1).z
    property string programa: ""
    property string nombre: ""
    property string otro: ""
    property string fichero: ""
    property bool propio: false
    property bool virtualkb: false
    id: anima
    visible: aplicaciones.get(cerrar(indice)-1).minimizado

    //contenedor del program
    Loader { x: 4; y: 23; height: parent.height -27; id: carga; width: maxi(2) -5
        source: rpropio(propio,programa)
        clip: true
    }

    MouseArea {
        enabled: false
        width: parent.width; height: parent.height; z:200
        onClicked: cambioZ(cerrar(indice)-1)
    }

    BorderImage {
          width: maxi(2); height: parent.height
          border { left: 23; top: 23; right: 23; bottom: 23 }
          horizontalTileMode: BorderImage.Repeat
          verticalTileMode: BorderImage.Stretch
          smooth: false
          source: enfocado(1,parent.z, aplicaciones.count)

          Item {
              clip: true
              y: 5; z: 10
              width: parent.width -65
              height: 30
              x: 23
              Text {
                  horizontalAlignment: Text.AlignHCenter
                  width: parent.width
                  text: nombre
                  color: enfocado(2,parent.parent.parent.z, aplicaciones.count)
                  font.pixelSize: 12
              }
          }

          Image { //Cerrar Aplicacion
             x: 3; y: 3; z: parent.z + 1
             source: "ventana/c.png"
             smooth: false
             MouseArea {
                height: parent.height; width: parent.width
                z: 100
                onClicked: {
                    ordenar(indice)
                    parent.parent.parent.destroy()
                }
             }
          }
        Image { //Maximizar Aplicacion
             x: parent.width -23; y: 3; z: parent.z + 1
             source: enfocado(3,parent.parent.z, aplicaciones.count)
             smooth: false
             MouseArea {
                height: parent.height; width: parent.width
                z: 100
                onClicked: {
                    maximizar(indice)}
             }
        }
        Image { //Minimizar
             x: parent.width -42; y: 3; z: parent.z + 1
             source: "ventana/mi.png"
             smooth: false
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
            onPressed: enfoca(indice-1)
            onClicked: enfoca(indice-1)
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
