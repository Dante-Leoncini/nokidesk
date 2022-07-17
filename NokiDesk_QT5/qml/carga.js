var component;
var sprite;

function creaPanel(tema) {
    component = Qt.createComponent("temas/"+tema+"/panel/panel.qml");
    if (component.status == Component.Ready)
        terminarCreacion();
    else
        component.statusChanged.connect(terminarCreacion);
}

function terminarCreacion() {
    if (component.status == Component.Ready) {
        sprite = component.createObject(root);

        if (sprite == null) {
            // Manejo de error
            console.log("Error al crear objeto");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
