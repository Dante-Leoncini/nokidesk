import QtQuick 2.1

Item {
    id: window
    width: parent.parent.width
    height: parent.parent.height
    clip: true


    //Cielo
    Image {
        x: 0; y: 0
        width: parent.width
        fillMode: Image.Tile //Repite la imagen
        source: "images/cielo.png"
    }

    //Nuve 1
    Item {
        id: nuve1
        y: 10; x: -100
        clip: true
        width: 145; height: 72
        property int animacion: 0
        property int sprite: 16
        property variant nuve: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/nuve1.png"}
    }

    Item {
        id: nuve2
        y: 10; x: 160
        clip: true
        width: 124; height: 47
        property int animacion: 0
        property int sprite: 16
        property variant nuve: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/nuve2.png"}
    }

    Item {
        id: nuve3
        y: 10; x: 100
        clip: true
        width: 54; height: 31
        property int animacion: 0
        property int sprite: 16
        property variant nuve: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/nuve3.png"}
    }

    //Fondo
    Image {
        x: 0; y: 63
        width: parent.width
        fillMode: Image.Tile //Repite la imagen
        source: "images/back.png"
    }

    //Azul del Agua
    Rectangle {
        x: 0; y: 223
        width: parent.width
        height: parent.height -y
        color: "#323b7e"
    }

    //Agua 1
    Item {
        id: agua1
        y: 210; x: 0
        clip: true
        width: parent.width; height: 37
        property int animacion: 0
        property int sprite: 0
        property variant agua: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/Agua.png"}
    }

    //Agua 2
    Item {
        id: agua2
        y: 230; x: 0
        clip: true
        width: parent.width; height: 37
        property int animacion: 0
        property int sprite: 8
        property variant agua: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/Agua.png"}
    }

    //Escenario. Rodillo
    Image {
        x: 30; y: 10
        source: "images/roller.png"
    }

    Item { //Worms
        id: worms
        property int animacion: 0
        property int sprite: 3
        property variant estado: "quieto"

        //Lista de Animaciones
        property variant quieto: [25, 28, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant camina: [31, 29, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
        property variant enfermo: [24, 23, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant cansado: [24, 27, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant mira_atras: [24, 27, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant mira_arriba: [24, 27, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant venganza: [28, 26, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant mira_jugador: [28, 33, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2]
        property variant astuto: [24, 26, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
        property variant vigote: [28, 26, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                                  31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]

        x: 225; y: 164
        width: worms[estado][0]; height: worms[estado][1]
        clip: true

        //Al hacerle click cambia la animacion
        MouseArea {
            width: parent.width
            height: parent.height
            onClicked: {cambia(); flecha.visible = false}
        }

        //Para dar vuelta el sprite
        //transform: Scale { origin.x: 0; origin.y: 0; xScale: -1; yScale: -1}

        Image {
            id: grafico
            x: 0; y: -parent.height * parent.animacion
            source: imagen()
        }
    }

    function mira(){

        if (grafico.mirror == false){
            if (worms.estado == "camina"){return worms.x -60 - worms.sprite / 2}
            else {return worms.x -60}
        }
        else {
            if (worms.estado == "camina"){return worms.x +60 + worms.sprite / 2}
            else {return worms.x +60}
        }
    }

    //Mira Roja
    Item {
        //worms[estado]
        property variant gusano: "worms"

        y: worms.y +3; x: mira(gusano);
        clip: true
        width: 25; height: 24
        Image{source: "images/mira_roja.png"}
    }

    //Flecha Roja
    Item {
        id: flecha
        y: worms.y -80; x: worms.x -3
        clip: true
        width: 29; height: 50
        property int animacion: 0
        property int sprite: 0
        property variant flecha: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
        Image{
            x: 0; y: -parent.height * parent.animacion
            source: "images/flecha_roja.png"}
    }

    //Agua 3
    Item {
        id: agua3
        y: 250; x: 0
        clip: true
        width: parent.width; height: 37
        property int animacion: 0
        property int sprite: 20
        property variant agua: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/Agua.png"}
    }

    //Agua 4
    Item {
        id: agua4
        y: 270; x: 0
        clip: true
        width: parent.width; height: 37
        property int animacion: 0
        property int sprite: 16
        property variant agua: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/Agua.png"}
    }
    //Agua 5
    Item {
        id: agua5
        y: 290; x: 0
        clip: true
        width: parent.width; height: 37
        property int animacion: 0
        property int sprite: 7
        property variant agua: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11]
        Image{
            width: parent.width
            x: 0; y: -parent.height * parent.animacion
            fillMode: Image.Tile //Repite la imagen
            source: "images/Agua.png"}
    }
    function imagen(){
        if (worms.estado == "camina"){return "images/camina.png"}
        else if (worms.estado == "quieto"){return "images/worm.png"}
        else if (worms.estado == "enfermo"){return "images/enfermo.png"}
        else if (worms.estado == "cansado"){return "images/cansado.png"}
        else if (worms.estado == "mira_atras"){return "images/mira_atras.png"}
        else if (worms.estado == "mira_arriba"){return "images/mira_arriba.png"}
        else if (worms.estado == "astuto"){return "images/astuto.png"}
        else if (worms.estado == "venganza"){return "images/venganza.png"}
        else if (worms.estado == "mira_jugador"){return "images/mira_jugador.png"}
        else if (worms.estado == "vigote"){return "images/vigote.png"}
    }

    function cambia(){
        if (worms.estado == "camina"){worms.estado = "quieto"; worms.sprite = 2}
        else if (worms.estado == "quieto"){
            worms.estado = "enfermo"
            worms.sprite = 2
            worms.x = worms.x -7
        }
        else if (worms.estado == "enfermo"){
            worms.estado = "cansado"
            worms.sprite = 2
        }
        else if (worms.estado == "cansado"){
            worms.estado = "mira_atras"
            worms.sprite = 2
        }
        else if (worms.estado == "mira_atras"){
            worms.estado = "mira_arriba"
            worms.sprite = 2
        }
        else if (worms.estado == "mira_arriba"){
            worms.estado = "astuto"
            worms.sprite = 2
        }
        else if (worms.estado == "astuto"){
            worms.estado = "mira_jugador"
            worms.sprite = 2
        }
        else if (worms.estado == "mira_jugador"){
            worms.estado = "venganza"
            worms.sprite = 2
        }
        else if (worms.estado == "venganza"){
            worms.estado = "vigote"
            worms.sprite = 2
        }
        else if (worms.estado == "vigote"){
            worms.estado = "camina"
            worms.sprite = 2
        }
    }

    //Text {
    //    text: worms.sprite
    //    color: "red"
    //}

    //Animacion del Worms
    function animacion(estado){
        if (worms.sprite < worms[estado].length -1){
            worms.sprite = worms.sprite +1
            worms.animacion = worms[estado][worms.sprite]
        }
        //Si la animacion termino se reinicia
        else if (worms.sprite == worms[estado].length -1){
            worms.sprite = 2
                 if (worms.estado == "camina" && grafico.mirror == false){worms.x = worms.x -9}
            else if (worms.estado == "camina" && grafico.mirror == true){worms.x = worms.x +9}
            worms.animacion = worms[estado][worms.sprite]
        }

        //Animacion de la Flecha de Seleccion
        if (flecha.visible == true){
            if (flecha.sprite < flecha.flecha.length -1){
                flecha.sprite = flecha.sprite +1
                flecha.animacion = flecha.flecha[flecha.sprite]
            }
            else if (flecha.sprite == flecha.flecha.length -1){
                flecha.sprite = 0
                flecha.animacion = flecha.flecha[flecha.sprite]
            }
        }

        //Animacion del Agua
        if (agua1.visible == true){
            if (agua1.sprite < agua1.agua.length -1){
                agua1.sprite = agua1.sprite +1
                agua1.animacion = agua1.agua[agua1.sprite]
            }
            else if (agua1.sprite == agua1.agua.length -1){
                agua1.sprite = 0
                agua1.animacion = agua1.agua[agua1.sprite]
            }
        }
        if (agua2.visible == true){
            if (agua2.sprite < agua2.agua.length -1){
                agua2.sprite = agua2.sprite +1
                agua2.animacion = agua2.agua[agua2.sprite]
            }
            else if (agua2.sprite == agua2.agua.length -1){
                agua2.sprite = 0
                agua2.animacion = agua2.agua[agua2.sprite]
            }
        }
        if (agua3.visible == true){
            if (agua3.sprite < agua3.agua.length -1){
                agua3.sprite = agua3.sprite +1
                agua3.animacion = agua3.agua[agua3.sprite]
            }
            else if (agua3.sprite == agua3.agua.length -1){
                agua3.sprite = 0
                agua3.animacion = agua3.agua[agua3.sprite]
            }
        }
        if (agua4.visible == true){
            if (agua4.sprite < agua4.agua.length -1){
                agua4.sprite = agua4.sprite +1
                agua4.animacion = agua4.agua[agua4.sprite]
            }
            else if (agua4.sprite == agua4.agua.length -1){
                agua4.sprite = 0
                agua4.animacion = agua4.agua[agua4.sprite]
            }
        }
        if (agua5.visible == true){
            if (agua5.sprite < agua5.agua.length -1){
                agua5.sprite = agua5.sprite +1
                agua5.animacion = agua5.agua[agua5.sprite]
            }
            else if (agua5.sprite == agua5.agua.length -1){
                agua5.sprite = 0
                agua5.animacion = agua5.agua[agua5.sprite]
            }
        }

        //Nuves
        if (nuve1.visible == true){
            if (nuve1.sprite < nuve1.nuve.length -1){
                nuve1.sprite = nuve1.sprite +1
                nuve1.animacion = nuve1.nuve[nuve1.sprite]
                nuve1.x = nuve1.x +1
            }
            else if (nuve1.sprite == nuve1.nuve.length -1){
                nuve1.sprite = 0
                nuve1.animacion = nuve1.nuve[nuve1.sprite]
                nuve1.x = nuve1.x +1
            }
        }
        if (nuve1.x > window.width){nuve1.x = -nuve1.width}

        if (nuve2.visible == true){
            if (nuve2.sprite < nuve2.nuve.length -1){
                nuve2.sprite = nuve2.sprite +1
                nuve2.animacion = nuve2.nuve[nuve2.sprite]
                nuve2.x = nuve2.x -1
            }
            else if (nuve2.sprite == nuve2.nuve.length -1){
                nuve2.sprite = 0
                nuve2.animacion = nuve2.nuve[nuve2.sprite]
                nuve2.x = nuve2.x -1
            }
        }
        if (nuve2.x < -nuve2.width){nuve2.x = window.width}

        if (nuve3.visible == true){
            if (nuve3.sprite < nuve3.nuve.length -1){
                nuve3.sprite = nuve3.sprite +1
                nuve3.animacion = nuve3.nuve[nuve3.sprite]
                nuve3.x = nuve3.x +2
            }
            else if (nuve3.sprite == nuve3.nuve.length -1){
                nuve3.sprite = 0
                nuve3.animacion = nuve3.nuve[nuve3.sprite]
                nuve3.x = nuve3.x +2
            }
        }
        if (nuve3.x > window.width){nuve3.x = -nuve3.width}
    }


    Timer {
        interval: 32; running: true; repeat: true
        
        
        onTriggered: animacion(worms.estado)
    }

    function camina(x){
        //worms.destroy();
        worms.sprite = 1;
        if (flecha.visible == true){flecha.visible = false};    
        if (worms.estado != "camina"){
            worms.estado = "camina"
            if (x == 1){grafico.mirror = false}
            else {grafico.mirror = true};
        }
        else {     
            if (grafico.mirror == true){worms.x = worms.x + worms.sprite / 2}
            else {worms.x = worms.x - worms.sprite / 2}
            worms.estado = "quieto"
        };
        //console.log("camina");
        return null;
    }

    function para(){
        //worms.destroy();
        worms.sprite = 1;
        worms.estado = "quieto"
        console.log("para");
        return null;
    }

    function fullscreen(){
        //worms.destroy();
        if (aplicaciones.get(cerrar(indice)-1).maximizado == false){
            aplicaciones.get(cerrar(indice)-1).maximizado = true}
        else {aplicaciones.get(cerrar(indice)-1).maximizado = false};
        //console.log("fullscreen");
        //console.log(aplicaciones.get(cerrar(indice)-1).maximizado);
        return null;
    }


    focus: true
    //Keys.onSpacePressed: camina()
    Keys.onSpacePressed: fullscreen()
    Keys.onLeftPressed: camina(1)

    //Keys.onRightPressed: camina(2)
    Keys.onRightPressed: camina(2)

    Keys.onReleased: {
        if (event.key == Qt.Key_Enter){para()};
    }

    //Keys.onRightReleased: para()
    Keys.onUpPressed: camina(1)
    Keys.onDownPressed: camina(1)


    //pone como foco activo el programa al termianr de abrir
    Component.onCompleted: forceActiveFocus();
    

    //Keys.onPressed: {
    //    if (event.key == Qt.Key_Enter) {camina()}
    //}

    

}
