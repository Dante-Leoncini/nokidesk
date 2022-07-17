import QtQuick 1.0

Item{
	id: block
        property int drag_ena:1

       /* Behavior on x{
            SpringAnimation{spring: 2; damping: 0.2 }
        }
        Behavior on y {
            SpringAnimation{ spring: 2; damping: 0.2}
        }*/

	Image {
		id: img
		anchors.fill: parent
		source:"../pics/redStone.png";
        }
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            onEntered:{
                if(drag_ena == 1){
                    drag.target=block;
                    drag.axis=Drag.XandYAxis;
                }
                else{
                    drag.target = null;
                }
            }
        }
}
