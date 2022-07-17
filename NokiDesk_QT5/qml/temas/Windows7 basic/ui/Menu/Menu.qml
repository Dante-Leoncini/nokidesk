import QtQuick 2.1

BorderImage {
    width: parent.width
    height: 20
    border { left: 1; top: 1; right: 1; bottom: 1 }
    horizontalTileMode: BorderImage.Stretch
    verticalTileMode: BorderImage.Stretch
    source: "Menu.png"
    smooth: false

    Component.onCompleted: {
      programa.margen_top = 20
    }
}

/*
BorderImage {
    width: parent.width
    height: 20
    border { left: 1; top: 1; right: 1; bottom: 1 }
    horizontalTileMode: BorderImage.Stretch
    verticalTileMode: BorderImage.Stretch
    source: "Menu.png"

    MouseArea {
        width: parent.width
        height: parent.height
        onClicked: myFile.write(textInput.text);
    }

    BorderImage {
        id: archivos
        width: 53; height: 18; x: 1; y: 1
        border { left: 3; top: 1; right: 3; bottom: 1 }
        source: ""
        property bool abierto: false

        Text {
            x: 6; y: 1
            text: "Archivo"
            color: "black"
            font.family: segoeui.name
            font.pixelSize: 12
        }

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true
            onEntered: {
              if (parent.abierto == true){}
              else {parent.source = "over.png"}
            }
            onExited: {
              if (parent.abierto == true){}
              else {parent.source = ""}
            }
            onClicked: {
              parent.source = "click.png"
              MyScript.createSpriteObjects(
                  parent.parent.x + 7, 235,
                  ["Nuevo","Abrir...","Guardar","Guardar como...","Configurar pagina...", "Imprimir...", "Salir"],
                  ["Ctrl+N","Ctrl+A","Ctrl+G","", "", "Ctrl+P", ""],
                  [false,false,true,false,false,false,true],
                  [0,0,1,0,0,0,2],
                  ["","","","","","",""],
                  [4,6])
              parent.abierto = true
            }
        }
    }

    BorderImage {
        id: edicion
        width: 51; height: 18; x: 56; y: 1
        border { left: 3; top: 1; right: 3; bottom: 1 }
        source: ""
        property bool abierto: false

        Text {
            x: 6; y: 1
            text: "Edicion"
            color: "black"
            font.family: segoeui.name
            font.pixelSize: 12
        }

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true
            onEntered: {
              if (parent.abierto == true){}
              else {parent.source = "over.png"}
            }
            onExited: {
              if (parent.abierto == true){}
              else {parent.source = ""}
            }
            onClicked: {
              parent.source = "click.png"
              MyScript.createSpriteObjects(
                  parent.x + 7, 235,
                  ["Deshacer","Cortar","Copiar","Pegar","Eliminar", "Buscar...", "Buscar siguiente", "Reemplazar...", "Ir a...", "Seleccionar todo", "Hora y fecha"],
                  ["Ctrl+Z","Ctrl+X","Ctrl+C","Ctrl+V", "Supr", "Ctrl+B", "F3", "Ctrl+R", "Ctrl+T", "Ctrl+E", "F5"],
                  [false,true,true,true,false,false,false,false,false,true,false],
                  [0,5,4,6,0,0,0,0,0,7,0],
                  ["","","","","","","","","","",""],
                  [1,5,9])
              parent.abierto = true
            }
        }
    }

    BorderImage {
        id: formato
        width: 57; height: 18; x: 109; y: 1
        border { left: 3; top: 1; right: 3; bottom: 1 }
        source: ""
        property bool abierto: false

        Text {
            x: 6; y: 1
            text: "Formato"
            color: "black"
            font.family: segoeui.name
            font.pixelSize: 12
        }

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true
            onEntered: {
              if (parent.abierto == true){}
              else {parent.source = "over.png"}
            }
            onExited: {
              if (parent.abierto == true){}
              else {parent.source = ""}
            }
            onClicked: {
              parent.source = "click.png"
              MyScript.createSpriteObjects(
                  parent.x + 7, 170,
                  ["Ajuste de linea","Fuente..."],
                  ["",""],
                  [false,false],
                  [0,0],
                  [tilde(ajustelinea()),""],
                  [])
              parent.abierto = true
            }
        }
    }

    BorderImage {
        id: ver
        width: 29; height: 18; x: 168; y: 1
        border { left: 3; top: 1; right: 3; bottom: 1 }
        source: ""
        property bool abierto: false

        Text {
            x: 6; y: 1
            text: "Ver"
            color: "black"
            font.family: segoeui.name
            font.pixelSize: 12
        }

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true
            onEntered: {
              if (parent.abierto == true){}
              else {parent.source = "over.png"}
            }
            onExited: {
              if (parent.abierto == true){}
              else {parent.source = ""}
            }
            onClicked: {
              parent.source = "click.png"
              MyScript.createSpriteObjects(
                  parent.x + 7, 174,
                  ["Barra de estado","Modo teclado"],
                  ["",""],
                  [false,true],
                  [0,3],
                  ["",""],
                  [])
              parent.abierto = true
            }
        }
    }

    BorderImage {
        id: ayuda
        width: 46; height: 18; x: 199; y: 1
        border { left: 3; top: 1; right: 3; bottom: 1 }
        source: ""
        property bool abierto: false

        Text {
            x: 6; y: 1
            text: "Ayuda"
            color: "black"
            font.family: segoeui.name
            font.pixelSize: 12
        }

        MouseArea {
            width: parent.width
            height: parent.height
            hoverEnabled: true
            onEntered: {
              if (parent.abierto == true){}
              else {parent.source = "over.png"}
            }
            onExited: {
              if (parent.abierto == true){}
              else {parent.source = ""}
            }
            onClicked: {
              parent.source = "click.png"
              MyScript.createSpriteObjects(
                  parent.x + 7, 223,
                  ["Ver la Ayuda","Acerca del Bloc de notas"],
                  ["",""],
                  [false,false],
                  [0,0],
                  ["",""],
                  [1])
              parent.abierto = true
            }
        }
    }

}
*/
