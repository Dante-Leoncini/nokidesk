/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the Technology Preview License Agreement accompanying
** this package.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
**
**
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0
import "content"

Rectangle {
    id: window
    x: 8; y: 30
    width: maxi(2) -16
  height: parent.parent.height -38
    clip: true

    property string currentFeed: "rss.news.yahoo.com/rss/topstories"
    property bool loading: feedModel.status == XmlListModel.Loading

    RssFeeds { id: rssFeeds }

    XmlListModel {
        id: feedModel
        source: "http://" + window.currentFeed
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "description"; query: "description/string()" }
    }

    Row {
        Rectangle {
            width: 120; height: window.height
            color: "#efefef"

            ListView {
                focus: true
                id: categories
                anchors.fill: parent
                model: rssFeeds
                footer: quitButtonDelegate
                delegate: CategoryDelegate {}
                highlight: Rectangle { color: "steelblue" }
                highlightMoveSpeed: 9999999
            }
            ScrollBar {
                scrollArea: categories; height: categories.height; width: 8
                anchors.right: categories.right
            }
        }
        ListView {
            id: list
            width: window.width - 20; height: window.height
            model: feedModel
            delegate: NewsDelegate {}
        }
    }
    Component {
        id: quitButtonDelegate
        Item {
            width: categories.width; height: 20
            Text {
                text: "Quit"
                font { family: "Helvetica"; pixelSize: 12; bold: true }
                anchors {
                    left: parent.left; leftMargin: 5
                    verticalCenter: parent.verticalCenter
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }
    }
    ScrollBar { scrollArea: list; height: list.height; width: 8; anchors.right: window.right }
    Rectangle { x: 120; height: window.height; width: 1; color: "#cccccc" }
}
