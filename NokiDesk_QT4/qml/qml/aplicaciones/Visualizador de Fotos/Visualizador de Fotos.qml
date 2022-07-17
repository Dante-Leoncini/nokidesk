import QtQuick 1.1

Image {
  id: "visor"
  width: parent.parent.width
  height: parent.parent.height

  source: "transparencia.png"
  fillMode: Image.Tile
  clip: true

  function nombreArchivo(x) {
      if ("file:///E:/" == x){return "Disco local (E:)"}
      else {
      var result = x+""
      var resultado = result.lastIndexOf('/');
      return result.substring(resultado + 1)}}

  function titulo(){
      if (aplicaciones.get(cerrar(indice)-1).archivo == ""){aplicaciones.get(cerrar(indice)-1).nombre = "Visualizador de Fotos de Windows"}
      else {aplicaciones.get(cerrar(indice)-1).nombre = nombreArchivo(aplicaciones.get(cerrar(indice)-1).archivo) + " - Visualizador de Fotos de Windows"}
  }

  Component.onCompleted: {titulo()}

  Flickable {
     id: scroller
     height: parent.height
     width: parent.width
     contentWidth: fotografia.width * fotografia.scale
     contentHeight: fotografia.height * fotografia.scale

     PinchArea{
         width: parent.width; height: parent.height
         pinch.target: fotografia
         pinch.minimumScale: 0
         pinch.maximumScale: 10

        Image{
            id: fotografia
            source: aplicaciones.get(cerrar(indice)-1).archivo
            //sourceSize.width: 640
            //sourceSize.height: 480
            fillMode: Image.PreserveAspectFit
            asynchronous: true

        Text {
            color: "red"
            text: fotografia.scale
        }
        }
      }

  }
}
