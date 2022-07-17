var component;
var sprite;

function createSpriteObjects(x, ancho, str, str2, activos, funciones, iconos, str3) {
    component = Qt.createComponent("submenu.qml");
    if (component.status == Component.Ready)
        finishCreation(x, ancho, str, str2, activos, funciones, iconos, str3);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(x, ancho, str, str2, activos, funciones, iconos, str3) {
    if (component.status == Component.Ready) {
        sprite = component.createObject(parent.parent, {
            "x": x,
            "width": ancho,
            "lista" : str,
            "lista2" : str2,
            "activos" : activos, 
            "funciones" : funciones,
            "iconos" : iconos,
            "lista3" : str3
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
