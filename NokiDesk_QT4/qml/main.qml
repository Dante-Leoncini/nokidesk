import QtQuick 1.1
//import QtWebKit 1.0
//import Qt3d 1.0

Item {
    id: window
    //estas 2 propiedades no tienen nada que ver con el alto/ancho de la pantalla.
    //son valores globales para que las app de qml hagan calculos
    property real palto: 0; property real pancho: 0
    property string tema: "Windows7 basic"

    width: screenWidth
    height: screenHeight

    //SeA+ales que se reciben y envian
    signal recibirx(string x)
    signal recibiry(string y)

    onRecibirx: {mueveMouseX(x)}
    onRecibiry: {mueveMouseY(y)}

    function debug(){
        console.log(screenWidth + " " + screenHeight)
    }
    Component.onCompleted: debug();

    function mueveMouseX(x){ //Posicion X
        var xm = raton.x + parseInt(x)
        if (0 > xm) {raton.x = 0}
        else if (anchoSalida < xm) {raton.x = anchoSalida -1}
        else {raton.x = xm}
    }

    function mueveMouseY(y){ //Posicion Y
        var ym = raton.y + parseInt(y)
        if (0 > ym) {raton.y = 0}
        else if (altoSalida < ym) {raton.y = altoSalida -1}
        else {raton.y = ym}
    }

    Image{ //Fondo de pantalla
      source: "temas/"+tema+"/fondos/fondo.png"
      fillMode: Image.PreserveAspectCrop
      width: screenWidth
      height: screenHeight
    }

    ListModel { //Lista de programas abiertos
        id: aplicaciones
    }

    Rectangle { //Panel personalizado
        height: 0; width: 0; z: 100
        Loader {source: "temas/"+tema+"/panel/panel.qml"}
    }

    Image{ //Posicion y dibujo del Raton
        id: raton
        visible: false
        source: "temas/"+tema+"/cursor/flecha.png"
        x: screenWidth / 2; y: screenHeight / 2; z: 100
    }

    function rantonclick(a) {
        Cursor.pos.x = raton.x
        Cursor.pos.y = raton.y
        Cursor.click()
    }    

    //focus: true
    //Keys.onSpacePressed: aplicaciones.clear()
    //Keys.onTabPressed: aplicaciones.append(
    //    {"aplicacion": "aplicaciones/explorer.qml",
     //    "posX": 0, "posY": 0,
      //   "ancho": 300, "alto": 300})
//Keys.onLeftPressed: aplicaciones.move(0, aplicaciones.count - 1, 1)
    //Keys.onRightPressed: raton.x = raton.x +1
    //Keys.onUpPressed: raton.y = raton.y -1
    //Keys.onDownPressed: raton.y = raton.y +1
    //Keys.onEnterPressed: tamapantalla(screenWidth)
}
