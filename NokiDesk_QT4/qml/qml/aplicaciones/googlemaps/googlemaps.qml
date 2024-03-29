/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

// This example demonstrates how Web services such as Google Maps can be
// abstracted as QML types. Here we have a "Mapping" module with a "Map"
// type. The Map type has an address property. Setting that property moves
// the map. The underlying implementation uses WebView and the Google Maps
// API, but users from QML don't need to understand the implementation in
// order to create a Map.

import QtQuick 1.0
import QtWebKit 1.0
import "content/Mapping"

Map {
    id: map
    width: parent.parent.width
    height: parent.parent.height
    clip: true
    address: "Paris"

    Rectangle {
        x: 70
        width: input.width + 20
        height: input.height + 4
        anchors.bottom: parent.bottom; anchors.bottomMargin: 5
        radius: 5
        opacity: map.status == "Ready" ? 1 : 0

        TextInput {
            id: input
            text: map.address
            anchors.centerIn: parent
            Keys.onReturnPressed: map.address = input.text
        }
    }

    Text {
        id: loading
        anchors.centerIn: parent
        text: map.status == "Error" ? "Error" : "Loading"
        opacity: map.status == "Ready" ? 0 : 1
        font.pixelSize: 30

        Behavior on opacity { NumberAnimation{} }
    }
}
