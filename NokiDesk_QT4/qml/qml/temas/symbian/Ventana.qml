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
      if (x == 1 && aplicaciones.get(cerrar(indice)-1).maximizado == false) {return aplicaciones.get(cerrar(indice)-1).alto}

else if (x == 1 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return pantalto -24}

else if (x == 2 && aplicaciones.get(cerrar(indice)-1).maximizado == false) {return pantancho}//aplicaciones.get(cerrar(indice)-1).ancho}

else if (x == 2 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return pantancho +16}

else if (x == 3 && aplicaciones.get(cerrar(indice)-1).maximizado == false) {return aplicaciones.get(cerrar(indice)-1).x}

else if (x == 3 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return -8}

else if (x == 4 && aplicaciones.get(cerrar(indice)-1).maximizado == false) {return aplicaciones.get(cerrar(indice)-1).y}

else if (x == 4 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return -8}

else if (x == 5 && aplicaciones.get(cerrar(indice)-1).maximizado == false) {return true}

else if (x == 5 && aplicaciones.get(cerrar(indice)-1).maximizado == true) {return false}
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

function oculto(x){
    if (x == aplicaciones.count){return true}
    else {return false};
}

    property string indice: null
    height: pantalto -40 -24
    x: maxi(3); y: maxi(4) + 24
    z: aplicaciones.get(cerrar(indice)-1).z
    property string programa: null
    property string nombre: null
    property string otro: null
    property string fichero: null
    id: anima
    visible: oculto(z)
    Item {width: parent.width; height: parent.height
    Loader {source: "../../aplicaciones/"+programa+"/"+programa+".qml"}}


    MouseArea {
        enabled: false
        width: parent.width; height: parent.height; z:200
        onClicked: cambioZ(cerrar(indice)-1)
    }


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

    }
