/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
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

import QtQuick 1.0

Item {
    id: window
    x: 8; y: 30
    width: maxi(2) -16
    height: parent.parent.height -38
    clip: true

    Image {
        x: 0; y: 0
        source: "images/fondo.png"
    }

    Item { //Personaje
        id: personaje
        x: 30; y: 70
        width: 81; height: 138
        clip: true
        state: "quieto"
        property int animacion: 1

        MouseArea {
            width: parent.width
            height: parent.height
            onClicked: parent.x = parent.x + 10
        }

        Image {
            id: sprite
            x: 0; y: 0
            source: "images/braidm.png"
        }
    }

    Text {
        text: personaje.animacion
        color: "red"
    }

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: if (personaje.state == "quieto"){
                         if (personaje.animacion == 1){
                             personaje.animacion = 2
                             sprite.y = 0
                             sprite.x = 0
                         }
                         else if (personaje.animacion == 2){
                             personaje.animacion = 3
                             sprite.x = -81
                         }
                         else if (personaje.animacion == 3){
                             personaje.animacion = 4
                             sprite.x = -162
                         }
                         else if (personaje.animacion == 4){
                             personaje.animacion = 5
                             sprite.x = -243
                         }
                         else if (personaje.animacion == 5){
                             personaje.animacion = 6
                             sprite.x = -324
                         }
                         else if (personaje.animacion == 6){
                             personaje.animacion = 7
                             sprite.x = -405
                         }
                         else if (personaje.animacion == 7){
                             personaje.animacion = 8
                             sprite.x = -486
                         }
                         else if (personaje.animacion == 8){
                             personaje.animacion = 9
                             personaje.width = 80
                             sprite.x = -567
                         }
                         else if (personaje.animacion == 9){
                             personaje.animacion = 10
                             personaje.width = 81
                             sprite.x = -647
                         }
                         else if (personaje.animacion == 10){
                             personaje.animacion = 11
                             sprite.x = -728
                         }
                         else if (personaje.animacion == 11){
                             personaje.animacion = 12
                             sprite.x = -809
                         }
                         else if (personaje.animacion == 12){
                             personaje.animacion = 13
                             sprite.y = -138
                             sprite.x = -1
                         }
                         else if (personaje.animacion == 13){
                             personaje.animacion = 14
                             sprite.x = -82
                         }
                         else if (personaje.animacion == 14){
                             personaje.animacion = 15
                             personaje.width = 80
                             sprite.x = -163
                         }
                         else if (personaje.animacion == 15){
                             personaje.animacion = 16
                             sprite.x = -243
                         }
                         else if (personaje.animacion == 16){
                             personaje.animacion = 17
                             personaje.width = 81
                             sprite.x = -323
                         }
                         else if (personaje.animacion == 17){
                             personaje.animacion = 18
                             sprite.x = -403
                         }
                         else if (personaje.animacion == 18){
                             personaje.animacion = 19
                             sprite.x = -484
                         }
                         else if (personaje.animacion == 19){
                             personaje.animacion = 20
                             personaje.width = 80
                             sprite.x = -565
                         }
                         else if (personaje.animacion == 20){
                             personaje.animacion = 21
                             personaje.width = 81
                             sprite.x = -646
                         }
                         else if (personaje.animacion == 21){
                             personaje.animacion = 22
                             sprite.x = -727
                         }
                         else if (personaje.animacion == 22){
                             personaje.animacion = 1
                             sprite.x = -808
                         }
                     }
                     else if (personaje.state == "corre"){
                         if (personaje.animacion == 1){
                             personaje.animacion = 2
                             sprite.x = -168
                             sprite.y = -1
                             personaje.width = 32
                             personaje.height = 41
                         }
                         else if (personaje.animacion == 2){
                             personaje.animacion = 3
                             sprite.x = -201
                         }
                         else if (personaje.animacion == 3){
                             personaje.animacion = 4
                             personaje.x = personaje.x -2
                             sprite.x = -229
                         }
                         else if (personaje.animacion == 4){
                             personaje.animacion = 5
                             personaje.x = personaje.x +2
                             sprite.x = -264
                         }
                         else if (personaje.animacion == 5){
                             personaje.animacion = 6
                             sprite.x = -298
                         }
                         else if (personaje.animacion == 6){
                             personaje.animacion = 7
                             sprite.x = -330
                             personaje.width = 36
                         }
                         else if (personaje.animacion == 7){
                             personaje.animacion = 8
                             sprite.x = -366
                             personaje.x = personaje.x -2
                             personaje.width = 31
                         }
                         else if (personaje.animacion == 8){
                             personaje.animacion = 2
                             personaje.x = personaje.x +2
                             sprite.x = -168
                             sprite.y = -1
                             personaje.width = 32
                             personaje.height = 41
                         }
                     }

    }

    function corre(){
        personaje.destroy();
        return null;
    }

    focus: true
    Keys.onPressed: { if (event.key == Qt.Key_Enter) corre(); }
}
