import QtQuick 1.1

Item {
    id: submenu
    x: 0; y: 49
    height: 60; width: 60;
    property int posy: 3
    property int item: 0
    property variant lista: []
    property variant lista2: []
    property variant activos: []
    property variant funciones: []
    property variant lista3: []
    property variant iconos: []
    property bool separacion: false;
    Component.onCompleted: {ciclo(); choque()}

    //Text {id: test; color: "red"; x: 300; text: ""}
    function choque(){
      if (width + parent.x + x -5> pantancho){x = pantancho -width-parent.x +5}
    }

    function separando(){
      var cicr = 0;
      while (cicr < lista.length) {
        if (lista3[cicr] == item){
          separacion = true
          //test.text = test.text + "Encontrado<br>"
        }
        //else {test.text = test.text + lista3[cicr] + " " + item +"<br>"}
        cicr++
      }
      cicr = 0;
      //test.text = test.text + "<br>"
    }

    function ciclo(){
      while (item < lista.length) {
        separando()
        if(separacion){
          posy = posy + 4
          separ()
          posy = posy + 4
          crear()
          posy = posy + 22
          item++
        }
        else{
          crear()
          posy = posy + 22
          item++
        }
        separacion = false
      }
      submenu.height = posy +8
    }

    function crear(){
      var component;
      var sprite;
      component = Qt.createComponent("item.qml");
      sprite = component.createObject(submenu, {"x": 3, "y": posy, "it": item, "activos": activos[item], "funcion": funciones[item]});
    }

    function separ(){
      var component;
      var sprite;
      component = Qt.createComponent("separa.qml");
      sprite = component.createObject(submenu, {"y": posy});
    }

  MouseArea {
    x: -parent.parent.x -7
    y: -parent.parent.y -48
    width: pantancho; height: pantalto
    onClicked: {
      parent.destroy();
      desmarcar();
    }
  }

 
  BorderImage {
    height: parent.height; width: parent.width    
    border { left: 9; top: 10; right: 8; bottom: 8 }
    source: "submenu.png"
    
    Image {
        x: 29; y: 3
        height: parent.height -10
        source: "separa.png"
    }

    ParallelAnimation {
        id: playa
        running: true
        NumberAnimation {
            target: submenu; properties: "opacity"
            from: 0.0; to: 1.0;
            duration: 300
        }
}


  }
}