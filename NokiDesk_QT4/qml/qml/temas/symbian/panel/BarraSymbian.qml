import QtQuick 1.1
import com.nokia.symbian 1.1

Window {
    StatusBar{}

    Text {
        text: "Escritorio"
        color: "white"
        x: 1; y: 1; z: 1
    }

    ToolBar {
        anchors.bottom: parent.bottom
        z: 1
         ToolButton {
             iconSource: "toolbar-back"
         }
         ToolButton {
             iconSource: "toolbar-search"
             x: screen.width - 60
         }
         ToolButton {
             iconSource: "toolbar-menu"
             x: parent.width / 2 - 30
         }
    }
}