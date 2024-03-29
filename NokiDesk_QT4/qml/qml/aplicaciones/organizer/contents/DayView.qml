/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Mobility Components.
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

import Qt 4.7
import QtMobility.organizer 1.1

Flickable
{
     Rectangle {
         id : dayView

         anchors.fill : parent
         opacity : parent.opacity
         color: "#9eaf30"
         gradient: Gradient {
             GradientStop {
                 position: 0.00;
                 color: "#9eaf30";
             }
             GradientStop {
                 position: 0.89;
                 color: "#ffffff";
             }
         }

         ListView {
             id : hourList
             model : hourModel
             anchors.fill: parent
             clip: true
             focus: true
             opacity : parent.opacity

             delegate : hourDelegate
             highlight: hourHighlight
             preferredHighlightBegin: hourList.height * 0.5
             preferredHighlightEnd: preferredHighlightBegin
             highlightFollowsCurrentItem : true
             highlightMoveSpeed : 2000
             keyNavigationWraps : true

             onCurrentIndexChanged : {
                 if (timelineView.opacity > 0) {
                     calendar.currentDate = new Date(timelineView.year, timelineView.month, currentIndex + 1);
                     monthList.currentIndex = timelineView.month;
                     currentIndex = timelineView.day - 1;
                 }
             }

         }
         Component {
             id: hourHighlight
             Rectangle {
                 width: hourList.width;
                 height: hourList.height /7 ;
                 color: "lightsteelblue" ;radius: 5
             }
         }

         Component {
             id: hourDelegate


             Item {
                 width : hourList.width
                 height : childrenRect.height
                 property int rowIndex : index
                 id:hourDelegateInstanceItem

                 Column {
                     // Draw a line under the previous Hour list tiem
                     Rectangle {
                         height : 1
                         width : hourList.width
                         color : "black"
                     }

                     Text {
                        // text: hour
                         text: index + ":00"
                     }


                     // List all, if any, of the events within this hour.
                     Repeater {

                         focus: true

                         // Simple fetch ALL events on this day...and we will filter them by hour.
                         model: calendar.organizer.items? calendar.organizer.itemIds(new Date(calendar.year, calendar.month, calendar.day)
                                                                                     , new Date(calendar.year, calendar.month, calendar.day+1))
                                                        : 0

                         Row {
                             spacing:  4
                             Text {
                                 id: itemText
                                 clip: true
                                 focus: true
                                 property OrganizerItem oi: calendar.organizer.item(modelData)

                                 // Only display a link when the event starts within this hour......
                                 text: (hourDelegateInstanceItem.rowIndex == Qt.formatTime(oi.itemStartTime, "hh")) ? "<a href=\"#\">" + oi.displayLabel + "</a>":""
                                 onLinkActivated: {
                                     //detailsView.isNewItem = false;
                                     detailsView.item = oi;
                                     calendar.state = "DetailsView";
                                 }
                             }
                         }
                     }
                 }
             }

         }

         ListModel {
             id : hourModel
             ListElement {hour : "0:00"}
             ListElement {hour : "1:00"}
             ListElement {hour : "2:00"}
             ListElement {hour : "3:00"}
             ListElement {hour : "4:00"}
             ListElement {hour : "5:00"}
             ListElement {hour : "6:00"}
             ListElement {hour : "7:00"}
             ListElement {hour : "8:00"}
             ListElement {hour : "9:00"}
             ListElement {hour : "10:00"}
             ListElement {hour : "11:00"}
             ListElement {hour : "12:00"}
             ListElement {hour : "13:00"}
             ListElement {hour : "14:00"}
             ListElement {hour : "15:00"}
             ListElement {hour : "16:00"}
             ListElement {hour : "17:00"}
             ListElement {hour : "18:00"}
             ListElement {hour : "19:00"}
             ListElement {hour : "20:00"}
             ListElement {hour : "21:00"}
             ListElement {hour : "22:00"}
             ListElement {hour : "23:00"}
         }
     }
}
