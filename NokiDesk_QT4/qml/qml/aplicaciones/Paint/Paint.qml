import QtQuick 1.1

Item {
    id: paint
    width: parent.parent.width
    height: parent.parent.height
    clip: true
    property int unNumero: 300

    //Selector de Colores
    Rectangle {color: "#ece9d8"; width: parent.width; height: 50
        Rectangle {x: 3; y: 10; color: "#000000"; width: 13; height: 13} //negro
        Rectangle {x: 19; y: 10; color: "#ff0000"; width: 13; height: 13} //rojo
        Rectangle {x: 3; y: 26; color: "#ffffff"; width: 13; height: 13} //blanco
        Rectangle {x: 19; y: 26; color: "#00ff00"; width: 13; height: 13} //verde
    }

    Rectangle {y: 50; color: "#808080"; width: parent.width; height: parent.height -y}

    Image {
        x: 2; y: 52
        source: "image://canvas/red"
        sourceSize.width: 300
        sourceSize.height: 300
        cache: false
    }
}
