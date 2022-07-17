var component;
var sprite;

function createSpriteObjects(x,y,z,n) {
    component = Qt.createComponent("../Ventana.qml");
    if (component.status == Component.Ready)
        finishCreation(x,y,z,n);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(x,y,z,n) {
    if (component.status == Component.Ready) {
        sprite = component.createObject(parent.parent.parent, {
            "programa": x,
            "nombre" : n,
            "indice": y,
            "fichero": ""
        });
        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
