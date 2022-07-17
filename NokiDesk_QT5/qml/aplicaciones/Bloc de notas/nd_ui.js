var component;
var sprite;
menu

//Funcion que crea el menu
function menu(tema, padre) {
    component = Qt.createComponent("../../temas/"+tema+"/ui/Menu/Menu.qml");
    if (component.status == Component.Ready)
        crearMenu(padre);
    else
        component.statusChanged.connect(crearMenu);
}

function crearMenu(padre) {
    if (component.status == Component.Ready) {
        sprite = component.createObject(padre);

        if (sprite == null) {
            // Manejo de error
            console.log("Error al crear objeto");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

//ScrollBar Funciones
function scrollBar(tema, padre, scrollArea, orientation) {
    component = Qt.createComponent("../../temas/"+tema+"/ui/ScrollBar/ScrollBar.qml");
    if (component.status == Component.Ready)
        crearScrollbar(padre, scrollArea, orientation);
    else
        component.statusChanged.connect(crearScrollbar);
}

function crearScrollbar(padre, scrollArea, orientation) {
    if (component.status == Component.Ready) {
        sprite = component.createObject(padre, {
                                            "scrollArea": scrollArea,
                                            "orientation" : orientation
                                        });

        if (sprite == null) {
            // Manejo de error
            console.log("Error al crear objeto");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
