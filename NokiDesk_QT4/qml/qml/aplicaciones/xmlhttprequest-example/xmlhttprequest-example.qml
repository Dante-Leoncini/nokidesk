import QtQuick 1.0

Rectangle {
    x: 8; y: 30
    width: maxi(2) -16
  height: parent.parent.height -38
    clip: true

    function showRequestInfo(text) {
        log.text = log.text + "\n" + text
        console.log(text)
    }

    Text { id: log; anchors.fill: parent; anchors.margins: 10 }

    Rectangle {
        id: button
        anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.margins: 10
        width: buttonText.width + 10; height: buttonText.height + 10
        border.width: mouseArea.pressed ? 2 : 1
        radius : 5; smooth: true

        Text { id: buttonText; anchors.centerIn: parent; text: "Request data.xml" }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                log.text = ""
                console.log("\n")

                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                    if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                        showRequestInfo("Headers -->");
                        showRequestInfo(doc.getAllResponseHeaders ());
                        showRequestInfo("Last modified -->");
                        showRequestInfo(doc.getResponseHeader ("Last-Modified"));

                    } else if (doc.readyState == XMLHttpRequest.DONE) {
                        var a = doc.responseXML.documentElement;
                        for (var ii = 0; ii < a.childNodes.length; ++ii) {
                            showRequestInfo(a.childNodes[ii].nodeName);
                        }
                        showRequestInfo("Headers -->");
                        showRequestInfo(doc.getAllResponseHeaders ());
                        showRequestInfo("Last modified -->");
                        showRequestInfo(doc.getResponseHeader ("Last-Modified"));
                    }
                }

                doc.open("GET", "data.xml");
                doc.send();
            }
        }
    }
}

