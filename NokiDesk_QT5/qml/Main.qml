import QtQuick 2.1
import "carga.js" as Carga

Image {
    id: root
    property string tema: "Windows7 basic"
    //property string tema: "WindowsXP"
    //property string tema: "Windows98"
    //property string tema: "Windows3.1"
    property real palto: 0; property real pancho: 0
    property int pantalto: height
    property int pantancho: width

    signal crearPanel(string tema)
    onCrearPanel: {Carga.creaPanel(tema);}

    //Fondo de Pantalla
    source: "temas/"+tema+"/fondos/fondo.jpg"
    fillMode: Image.PreserveAspectCrop

    //Lista y informacion de los programas abiertos
    ListModel {id: aplicaciones}

    //Abre el Panel del Tema seleccionado
    Component.onCompleted: {Carga.creaPanel(tema);}
}
