import Qt 4.7

Item{
        id: block

     /*   Behavior on x{
            SpringAnimation{spring: 2; damping: 0.2 }
        }
        Behavior on y {
            SpringAnimation{ spring: 2; damping: 0.2}
        }
*/
        Image {
                id: img
                anchors.fill: parent
                source:"../pics/blueStone.png";
        }

}
