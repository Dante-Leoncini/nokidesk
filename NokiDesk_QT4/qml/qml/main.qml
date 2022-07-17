import QtQuick 1.1
//import QtWebKit 1.0
//import Qt3d 1.0


Item {
    id: window
    property real palto: 0; property real pancho: 0
    //property string tema: "symbian"
    property string tema: "Windows7 basic"

    Item {
        id: screen
        width: 1280
        height: 720
    }

    property int pantalto: screen.height
    property int pantancho: screen.width

        function tamapantalla(x) {
        if ( 360 < anchoSalida && 360 < altoSalida){
            window.width = screen.width
            window.height = screen.height
        }
    }

    //SeA+ales que se reciben y envian
    signal recibirx(string x)
    signal recibiry(string y)

    onRecibirx: {mueveMouseX(x)}

    onRecibiry: {mueveMouseY(y)}

    function mueveMouseX(x){ //Posicion X
        var xm = raton.x + parseInt(x)
        //console.log(xm)
        if (0 > xm) {raton.x = 0}
        else if (anchoSalida < xm) {raton.x = anchoSalida -1}
        else {raton.x = xm}
    }

    function mueveMouseY(y){ //Posicion Y
        var ym = raton.y + parseInt(y)
        //console.log(ym)
        if (0 > ym) {raton.y = 0}
        else if (altoSalida < ym) {raton.y = altoSalida -1}
        else {raton.y = ym}
    }

    Component.onCompleted: tamapantalla();


    Image{ //Fondo de pantalla
      source: "temas/"+tema+"/fondos/fondo.png"
      fillMode: Image.PreserveAspectCrop
      width: 1280
      height: 720
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
        x: screen.width / 2; y: screen.height / 2; z: 100
    }

    function rantonclick(a) {
        visible: Cursor.visible
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
    //Keys.onEnterPressed: tamapantalla(pantancho)
}
