import QtQuick 1.1
import Qt.labs.folderlistmodel 1.0
import "content"
import "content/explorer.js" as Logic

Item { //Explorador de Archivos de Windows7
    property int indice: 0
    property int vz: parent.parent.z
    property int cantidadapp: aplicaciones.count

function detalleactual(){
    return "42.png"
}

function actualfolder(){
    return "shell32_4.png"
}

function flechas(x){
if (enfocadot()) {
    if (x == 1 && indice > 0){return "ATRAS_A.PNG"}
else if (x == 1 && indice == 0) {return "ATRAS_I.PNG"}
else if (x == 2 && indice < Logic.lista.length) {return "ATRAS_A.PNG"}
    else {return "ATRAS_I.PNG"}}
else {
    if (x == 1 && indice > 0){return "ATRAS_AD.PNG"}
else if (x == 1 && indice == 0) {return "ATRAS_ID.PNG"}
else if (x == 2 && indice < Logic.lista.length) {return "ATRAS_AD.PNG"}
    else {return "ATRAS_ID.PNG"}}
}
function enfocadot(){
    if (vz == cantidadapp){return true}
    else {return false}
}

function activo(x){
    if (x == 1 && enfocadot()){return "#b9d1ea"}
    else if (x == 1) {return "#d7e4f2"}
    else if (x == 2 && enfocadot()){return "barra_direccion.png"}
    else if (x == 2) {return "barra_direccion_i.png"}
    else if (x == 3 && enfocadot()){return "barra_direccion_separador.png"}
    else if (x == 3) {return "barra_direccion_separador_i.png"}
}

function volver(x){
    if (x == 1 && 0< indice){
folderModel.folder = Logic.lista[indice-1];
laurl.text = ncarpeta(Logic.lista[indice-1])
indice--}
    if (x == 2 && Logic.lista.length > indice){
folderModel.folder = Logic.lista[indice+1];
laurl.text = ncarpeta(Logic.lista[indice+1])
indice++}
    }

    //Cuando abra el programa deja el nombre en blanco
    Component.onCompleted: {aplicaciones.get(cerrar(indice)-1).nombre = ""
}

//si no se selecciona la carpeta. Por defecto se abre el disco E
function carpeta(x){
    if (x == ""){return "/home/dante"}
    else {return x}
}

function cualicono(x, y, z)
{
cantidad.text = folderModel.count + " elementos"
if ("file:///E:/Videos" == x){return "../../temas/"+tema+"/iconos/videos.png"}

else if ("file:///E:/DCIM" == x){return "../../temas/"+tema+"/iconos/imagenes.png"}

else if ("file:///E:/Music" == x || "file:///E:/Sounds" == x){return "../../temas/"+tema+"/iconos/musica.png"}

else if ("file:///E:/download" == x){return "../../temas/"+tema+"/iconos/descargas.png"}

else if ("file:///E:/Documentos" == x){return "../../temas/"+tema+"/iconos/documentos.png"}

else if ("file:///E:/Escritorio" == x){return "../../temas/"+tema+"/iconos/escritorio.png"}

else if ("file:///C:/" == x){return "../../temas/"+tema+"/iconos/sistema.png"}

else if ("file:///E:/" == x || "file:///F:/" == x || "file:///Z:/" == x || "file:///D:/" == x){return "../../temas/"+tema+"/iconos/disco.png"}

else if (folderModel.isFolder(y)) {return "../../temas/"+tema+"/iconos/Carpeta.png"}

else if (extension(z) == "jpg") {return "../../temas/"+tema+"/iconos/imagen.png"}

else if (extension(z) == "mp4" || extension(z) == "avi" || extension(z) == "3gp"|| extension(z) == "wmv" || extension(z) == "mkv" || extension(z) == "mov" || extension(z) == "flv" || extension(z) == "ogm") {return "../../temas/"+tema+"/iconos/video.png"}

else if (extension(z) == "midi" || extension(z) == "aac"|| extension(z) == "wma" || extension(z) == "ogg" || extension(z) == "waw" || extension(z) == "amr" || extension(z) == "mp3") {return "../../temas/"+tema+"/iconos/audio.png"}

else if (extension(z) == "png") {return "../../temas/"+tema+"/iconos/png.png"}

else if (extension(z) == "sisx" || extension(z) == "sis") {return "../../temas/"+tema+"/iconos/sisx.png"}

else {return "../../temas/"+tema+"/iconos/archivo.png"};
}

function extension(x) {
    var re = /(?:\.([^.]+))?$/;
    var ext = re.exec(x)[1];
    return ext
}
function ncarpeta(x) {
    if ("file:///E:/" == x){return "Disco local (E:)"}
    else {
    var result = x+""
    var resultado = result.lastIndexOf('/');
    return result.substring(resultado + 1)}}

function ubicacion(x) {
    var resultado = x+""
    return resultado.substr(7)
}

function ejecutar(x,y) {
    if (extension(x) == "txt" || extension(x) == "qml" || extension(x) == "QML"|| extension(x) == "js" || extension(x) == "py" || extension(x) == "html" || extension(x) == "css" || extension(x) == "php"){
    abrirapp("Block de notas", ubicacion(x));
    }

    else if (extension(x) == "png" || extension(x) == "PNG" || extension(x) == "jpg" || extension(x) == "bmp" || extension(x) == "svg" || extension(x) == "gif"){
    abrirapp("Visualizador de Fotos", ubicacion(x));
    }

    else if (extension(x) == "AVI" || extension(x) == "avi" || extension(x) == "mp4" || extension(x) == "wmv" || extension(x) == "3gp" || extension(x) == "mkv"){
    abrirapp("Reproductor de Windows Media", x);
    }

    else {
        folderModel.folder = x
        indice++
        if (x == undefined) {Logic.lista.push("root")}
        else {Logic.lista.push(x)}
        laurl.text = ncarpeta(x)
    }
}

    function altdetalles() {
        if (detalles.visible == true)
            {return detalles.altura}
        else {return 0}
    }

    Item {id: detarra; width: parent.width; y: parent.height - 50}

    Rectangle { //muestra detalles de la carpeta
        id: detalles
        visible: true
        height: altdetalles()
        property int altura: parent.height - detarra.y
        y: parent.height - height
        width: parent.width
        color: "#f1f5fb"

        Image {width: parent.width;
                 source: "explorer_previa.png"

            MouseArea { //cambia el tamano de los detalles
              height: 38; width: parent.width; z: 500
              drag.target: detarra
              drag.axis: Drag.YAxis
              drag.maximumY: parent.parent.parent.height -30
              drag.minimumY: parent.parent.parent.height / 2 + 40
            }
    }

        Text {id: cantidad; text: "Cantidad"
            font.pixelSize: 9; 
            x: parent.height; y: 5 }
        Image {source:  detalleactual()
                 x: 3; y: 3
                 sourceSize.width: parent.height - 6
                 sourceSize.height: width}
    } 

    Image {
        x: 9; y: 2
        source: flechas(1)
        z: parent.z + 2
        MouseArea{
            width: parent.width;
            height: parent.height
            onClicked: volver(1)
        }
    }


    Image {
        x: 37; y: 2
        source: flechas(2)
        z: parent.z + 2
        mirror: true
        MouseArea{
            width: parent.width;
            height: parent.height
            onClicked: volver(2)
        }
    }

    //Barra de herramientas
    BorderImage {
        width: parent.width; height: 32; y: 32
        border { left: 1; top: 1; right: 1; bottom: 1 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "barra_herramientas.png"

        //Visualizacion
        Image {
            x: parent.width -122; y: 7
            source: "shell32_63011.png"
        }
        //Vista previa
        Image {
            x: parent.width -67; y: 7
            source: "shell32_16757.png"
        }
        //Ayuda
        Image {
            x: parent.width -31; y: 7
            source: "shell32_24.png"
        }
    } 
    
    BorderImage { //barra de direcciones
        width: parent.width - 80 -12 - 78
        height: 24; x: 78; y: 4
        z: 50
        border { left: 3; top: 3; right: 3; bottom: 3 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: activo(2)

        Image {
            x: parent.width -27
            source: activo(3)
        }

        Image {
            x: parent.width - 21; y: 5
            source: "refrescar.png"
                MouseArea{
                    width: parent.width;
                    height: parent.height
                    onClicked: folderModel.folder = folderModel.folder
                    }
        }

        Item {clip: true; width: parent.width - 27; height: parent.height

        Image {
            x: 27; y: 9
            source: "flecha_02.png"
        }

        Image {
            x: laurl.width + 51; y: 10
            source: "flecha_03.png"
         }

        //Carpeta actual 16x16
        Image {
            x: 4; y: 3
            source: actualfolder()
        }

        Text {
            id: laurl
            x: 41; y: 7
            text: ncarpeta(folderModel.folder)
            color: "black"
            font.pixelSize: 9 
        }}
    } 
    
    BorderImage {
        width: 80; height: 24; y: 4
        x: parent.width - 88; z: 50
        border { left: 3; top: 3; right: 3; bottom: 3 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "barra_direccion.png"

        Image {
            x: parent.width -20; y: 6
            source: "busqueda.png"
        }

        Text {
            x: 10; y: 7
            text: "Buscar"
            color: "#6d6d6d"
            font.pixelSize: 9
            font.italic: true 
        }
    }

    Rectangle {
        height: 34 
        width: parent.width
        color: activo(1)
    }

    //carpetas, vista
    Rectangle {
        y: 64; z: parent.z - 1
        width: parent.width
        height: parent.parent.parent.height -38 -24 - detalles.height
        color: "white"

        BorderImage { //scroll
            x: parent.width - 19; width: 18; y: 2
            height: parent.height -4
            border { left: 1; top: 12; right: 1; bottom: 11 }
            horizontalTileMode: BorderImage.Stretch
            verticalTileMode: BorderImage.Stretch
            source: "../scroll.png"}

        Component {
          id: fileDelegate
          Item {
            width: grid.cellWidth; height: grid.cellHeight
         
            Column {
              Image {
               source: cualicono(filePath, index, fileName)
               //anchors.horizontalCenter: parent.horizontalCenter
               x: 16
               sourceSize.width: 48
               sourceSize.height: 48
                MouseArea{
                    z: 100; width: 48; height: 48
                    onDoubleClicked: ejecutar(filePath, fileName)
                    }
                }

                    Text {text: fileName
                      width: 74; x: 3
                      horizontalAlignment: Text.AlignHCenter
                      font.pixelSize: 9
                      maximumLineCount: 3
                      wrapMode: Text.Wrap}
                 }
               }
            }

        GridView {
            id: grid
            width: parent.width
            height: parent.height
            cellWidth: 80; cellHeight: 85
            x: 12; y: 3
            clip: true

            FolderListModel {
                id: folderModel
                folder: {source: carpeta(aplicaciones.get(cerrar(indice)-1).archivo)}
                //nameFilters: ["*.qml"]
            }

            model: folderModel
            delegate: fileDelegate
            highlight: BorderImage {
        width: 74; height: 79; x: 3; y: 3
        border { left: 2; top: 2; right: 2; bottom: 2}
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "seleccion_p.png"}
        }

    //barra de scroll
    ScrollBar {
        scrollArea: grid; width: 12; x: parent.width -width
        height: parent.height
        orientation: Qt.Vertical
    }}

//codigo para pruebas
//Text {text: palto; x: 100; y: 100} //" indice: "+indice+ "<br>lista: " + Logic.lista[0] x: 30; y: 100; z: 1000}
}
