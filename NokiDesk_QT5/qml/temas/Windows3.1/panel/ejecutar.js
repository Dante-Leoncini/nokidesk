var component;
var sprite;

function aplicacion(x,y,z,n,fichero,propio) {
    component = Qt.createComponent("../Ventana.qml");
    if (component.status == Component.Ready)
        finishCreation(x,y,z,n,fichero,propio);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(x,y,z,n,fichero,propio) {
    if (component.status == Component.Ready) {
        sprite = component.createObject(parent.parent, {
            "programa": x,
            "nombre" : n,
            "indice": y,
            "fichero": fichero,
            "propio": propio
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
