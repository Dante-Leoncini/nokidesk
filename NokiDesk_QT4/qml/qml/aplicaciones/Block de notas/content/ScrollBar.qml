import QtQuick 1.0

Item {
    id: container

    property variant scrollArea
    property variant orientation: Qt.Vertical

    opacity: 1

    function position()
    {
        var ny = 0;
        if (container.orientation == Qt.Vertical)
            ny = scrollArea.visibleArea.yPosition * container.height;
        else
            ny = scrollArea.visibleArea.xPosition * container.width;
        if (ny > 0) return ny; else return 0;
    }

    function size()
    {
        var nh, ny;

        if (container.orientation == Qt.Vertical)
            nh = scrollArea.visibleArea.heightRatio * container.height;
        else
            nh = scrollArea.visibleArea.widthRatio * container.width;

        if (container.orientation == Qt.Vertical)
            ny = scrollArea.visibleArea.yPosition * container.height;
        else
            ny = scrollArea.visibleArea.xPosition * container.width;

        if (ny > 3) {
            var t;
            if (container.orientation == Qt.Vertical)
                t = Math.ceil(container.height - ny);
            else
                t = Math.ceil(container.width - ny);
            if (nh > t) return t; else return nh;
        } else return nh + ny;
    }

    BorderImage {
        source: "pics/scrollbar.png"
        border { left: 1; right: 1; top: 4; bottom: 4 }
        x: container.orientation == Qt.Vertical ? 1 : position()
        width: container.orientation == Qt.Vertical ? container.width : size()
        y: container.orientation == Qt.Vertical ? position() : 0
        height: container.orientation == Qt.Vertical ? size() : container.height

        //Text {x: -350
        //      y: 0
        //      text: "scrollArea.contentY: " + scrollArea.contentY +"<br>"+
        //            "parent.y: " + parent.y +"<br>"+
        //            "parent.height: " + parent.height +"<br>"+
        //            "parent.y + parent.height: " + (parent.y + parent.height)+"<br>"+
        //            "scrollArea.visibleArea.yPosition: " + scrollArea.visibleArea.yPosition +"<br>"+
        //            "container.height: " + container.height +"<br>"+
        //            "scrollArea.contentHeight: " + scrollArea.contentHeight +"<br>"+
        //            "Resultado: " + (scrollArea.contentHeight / container.height * parent.y)
        //      }

        MouseArea {
            width: parent.width
            height: parent.height

            onPositionChanged: {
               if (container.orientation == Qt.Vertical){
                   if (0 > parent.y + mouseY){parent.y = 0}
                   else if (container.height - parent.height < parent.y + mouseY){parent.y = container.height - parent.height}
                   else {parent.y = parent.y + mouseY}
                   scrollArea.contentY = scrollArea.contentHeight / container.height * parent.y
               }
               else {}                               
            }
        }
    }
}
