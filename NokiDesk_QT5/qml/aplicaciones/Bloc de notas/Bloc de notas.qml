import QtQuick 2.1
import FileIO 1.0
//import "../../temas/Windows3.1/ui/ScrollBar"
//import "../../temas/Windows3.1/ui/Menu"
import "nd_ui.js" as Ui

 Item { //Block de notas de windows7    

  id: programa
  property int margen_top: 0
  property int margen_right: 0
  property variant menu_list: { "Archivo": "", "Edicion": "", "Formato": "", "Ver": "", "Ayuda": "" }

  ListModel {id: menu_list}

  Component.onCompleted: {
    textInput.forceActiveFocus()
    Ui.scrollBar(tema, bloc, flipi, Qt.Vertical) //crea la Barra de Scroll
    Ui.menu(tema, parent) //Crea el Menu
    parent.parent.nombre = archivon(fichero) + ": Bloc de notas"
  }

  signal desmarcar()
  onDesmarcar: {
    archivos.abierto = false
    archivos.source = ""
    edicion.source = ""
    edicion.abierto = false
    formato.source = ""
    formato.abierto = false
    ver.source = ""
    ver.abierto = false
    ayuda.source = ""
    ayuda.abierto = false
  }

  signal vkabrir()
  signal vkcerrar()
  signal copiar()
  signal pegar()
  signal cortar()
  signal seleccionartodo()

  onVkabrir: {
    textInput.openSoftwareInputPanel()
    parent.parent.estado = "virtualkb"
    if(!textInput.activeFocus){textInput.forceActiveFocus()}
  }
  onVkcerrar: {
    parent.parent.estado = "normal"
    textInput.closeSoftwareInputPanel()
  }
  onCopiar: {textInput.copy()}
  onPegar: {textInput.paste()}
  onCortar: {textInput.cut()}
  onSeleccionartodo: {textInput.selectAll()}

  function archivon(x) {    
    var result = x+""
    var resultado = result.lastIndexOf('/'); //symbian
    //var resultado = result.lastIndexOf('\\'); //windows
    if (result == ""){return "Sin titulo"}
    else {return result.substring(resultado + 1)}
  }

  function guardar(){
    myFile.write(textInput.text);
  }

  function cerrarapp(){
    ordenar(indice)
    parent.parent.destroy();
  }

  function tilde(x){
    if (x){return "tilde.png"}
    else {return ""}
  }

  function ajustelinea(){
    if (textInput.wrapMode == Text.Wrap){return true}
    else {return false}
  }

  function selfun(x){
    if (x == 1){guardar()}
    else if (x == 2){cerrarapp()}
    else if (x == 3){
        if (parent.parent.estado == "virtualkb"){vkcerrar()}
        else {vkabrir()}
    }
    else if (x == 4){copiar()}
    else if (x == 5){cortar()}
    else if (x == 6){pegar()}
    else if (x == 7){seleccionartodo()}
  }

  //Menu del programa

    FileIO {
        id: myFile
        source: "\\home\dante\Documentos\prueba.txt"
    }

    BorderImage {
        id: bloc
        y: margen_top; width: parent.width
        height: parent.height -margen_top
        border { left: 2; top: 2; right: 2; bottom: 2 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "../../temas/"+tema+"/ui/block.png"
        clip: true
        smooth: false

    Flickable {
        id: flipi
        width: parent.width -margen_right; height: parent.height
        contentWidth: textInput.width
        contentHeight: textInput.height
        flickableDirection: Flickable.VerticalFlick
        //interactive: false
 
        TextEdit {
            id: textInput
            activeFocusOnPress: false
            x: 2
            //anchors.margins: 2
            width: parent.parent.width -22
            text: myFile.read();
            font.pixelSize: 12
            wrapMode: Text.Wrap
            selectByMouse: true
            selectedTextColor: "white"
            selectionColor: "#3399FF"

        MouseArea {width: parent.width; height: parent.height
            enabled: !parent.activeFocus
            onClicked: {parent.forceActiveFocus()
              if (!deviceinfo.isWirelessKeyboardConnected){}
              else {parent.openSoftwareInputPanel()}}
            }
        }
    }
    }
}
