import QtQuick 1.1

BorderImage {   
  border { left: 2; top: 1; right: 2; bottom: 1 }
  source: ""
  width: parent.width -11
  height: 22
  x: 3; y: 3
  property int it: 0
  property bool activos: false
  property variant funcion : ""

  function encima(x){
    if (x == ""){return ""}
    else if (activos){return "items.png"}
    else {return "itemis.png"}
  }

  function sobrei(){
    if (activos){return "item.png"}
    else {return "itemi.png"}
  }

  function colori(){
    if (activos){return "black"}
    else {return "#6d6d6d"}
  }

  

  Image {
    source: encima(parent.source)
    x: 26
  }

  Text {
      x: 32; y: 3
      text: lista[it]
      font.family: segoeui.name
      font.pixelSize: 12
      color: colori()
  }

  Text {
      x: 32; y: 3
      width: parent.width -50
      horizontalAlignment: Text.AlignRight
      text: lista2[it]
      font.family: segoeui.name
      font.pixelSize: 12
      color: colori()
  }

  Image {source: iconos[it]}

  MouseArea {
      width: parent.width
      height: parent.height
      hoverEnabled: true
      onEntered: parent.source = sobrei();
      onExited: parent.source = "";
      onClicked: {
        if (activos){
            selfun(funciones[it]);
            //"cerrarapp"();
            desmarcar();
            parent.parent.destroy()
        }
        else {}}
  }
}