import QtQuick 2.1

  Item { //Area de Scroll
      id: container
      width: 16
      x: parent.width - 20
      y: 15
      height: parent.height -30

      property variant scrollArea
      property int posmous: 0
      property variant orientation: Qt.Vertical

      Component.onCompleted: {
        programa.margen_right = 16
      }

      BorderImage { //barra de scroll
        width: 16; y: -15; x: +1
        height: parent.height +30
        border { left: 1; top: 16; right: 1; bottom: 16 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: "scroll.png"
        smooth: false
      }

      opacity: 1

      function visiblet()
      {
          if (container.height + 44> scrollArea.contentHeight) {return false}
          else {return true}
      }

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
          border { left: 1; right: 1; top: 3; bottom: 3 }
          x: container.orientation == Qt.Vertical ? 1 : position()
          width: container.orientation == Qt.Vertical ? container.width : size()
          y: container.orientation == Qt.Vertical ? position() : 0
          height: container.orientation == Qt.Vertical ? size() : container.height
          //visible: visiblet()
          smooth: false

          //Text {x: -350
          //      y: 0
          //      text: posmous + "<br>" + (scrollArea.contentHeight / container.height * parent.y -posmous)
          //            "scrollArea.contentY: " + scrollArea.contentY +"<br>"+
          //            "parent.y: " + parent.y +"<br>"+
          //            "parent.height: " + parent.height +"<br>"+
          //            "parent.y + parent.height: " + (parent.y + parent.height)+"<br>"+
          //            "scrollArea.visibleArea.yPosition: " + scrollArea.visibleArea.yPosition +"<br>"+
          //            "container.height: " + container.height +"<br>"+
          //            "scrollArea.contentHeight: " + scrollArea.contentHeight +"<br>"+
          //            "Resultado: " + (scrollArea.contentHeight / container.height * parent.y)
          //    }

          MouseArea {
              width: parent.width
              height: parent.height

              onPressed: {posmous = mouseY}
              onPositionChanged: {
                 if (container.orientation == Qt.Vertical){
                     if (0 > parent.y + mouseY -posmous){parent.y = 0}
                     else if (container.height - parent.height < parent.y + mouseY -posmous){parent.y = container.height - parent.height}
                     else {parent.y = parent.y + mouseY -posmous}
                     scrollArea.contentY = scrollArea.contentHeight / container.height * parent.y
                 }
                 else {}
              }
          }
      }
  }
