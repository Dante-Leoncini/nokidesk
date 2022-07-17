/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
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
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
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
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.0
import Qt.labs.platform 1.0

import io.qt.texteditor 1.0

Rectangle {
    id: window
    color: "white"
    visible: true

    //Component.onCompleted: {textArea.text = "text"}

    Shortcut {
        sequence: StandardKey.Open
        onActivated: openDialog.open()
    }
    Shortcut {
        sequence: StandardKey.SaveAs
        onActivated: saveDialog.open()
    }
    Shortcut {
        sequence: StandardKey.Quit
        onActivated: Qt.quit()
    }
    Shortcut {
        sequence: StandardKey.Copy
        onActivated: textArea.copy()
    }
    Shortcut {
        sequence: StandardKey.Cut
        onActivated: textArea.cut()
    }
    Shortcut {
        sequence: StandardKey.Paste
        onActivated: textArea.paste()
    }
    Shortcut {
        sequence: StandardKey.Bold
        onActivated: document.bold = !document.bold
    }
    Shortcut {
        sequence: StandardKey.Italic
        onActivated: document.italic = !document.italic
    }
    Shortcut {
        sequence: StandardKey.Underline
        onActivated: document.underline = !document.underline
    }

    FileDialog {
        id: openDialog
        fileMode: FileDialog.OpenFile
        selectedNameFilter.index: 1
        nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)"]
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: document.load(file)
    }

    FileDialog {
        id: saveDialog
        fileMode: FileDialog.SaveFile
        defaultSuffix: document.fileType
        nameFilters: openDialog.nameFilters
        selectedNameFilter.index: document.fileType === "txt" ? 0 : 1
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: document.saveAs(file)
    }

    FontDialog {
        id: fontDialog
        onAccepted: {
            document.fontFamily = font.family;
            document.fontSize = font.pointSize;
        }
    }

    ColorDialog {
        id: colorDialog
        currentColor: "black"
    }

    MessageDialog {
        id: errorDialog
    }

    ToolBar {
           id: herramientas
           width: parent.width
           leftPadding: 8

           Flow {
               id: flow
               width: parent.width

               Row {
                   id: fileRow
                   ToolButton {
                       id: openButton
                       text: "\uF115" // icon-folder-open-empty
                       font.family: "fontello"
                       onClicked: openDialog.open()
                   }
                   ToolSeparator {
                       contentItem.visible: fileRow.y === editRow.y
                   }
               }

               Row {
                   id: editRow
                   ToolButton {
                       id: copyButton
                       text: "\uF0C5" // icon-docs
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       enabled: textArea.selectedText
                       onClicked: textArea.copy()
                   }
                   ToolButton {
                       id: cutButton
                       text: "\uE802" // icon-scissors
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       enabled: textArea.selectedText
                       onClicked: textArea.cut()
                   }
                   ToolButton {
                       id: pasteButton
                       text: "\uF0EA" // icon-paste
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       enabled: textArea.canPaste
                       onClicked: textArea.paste()
                   }
                   ToolSeparator {
                       contentItem.visible: editRow.y === formatRow.y
                   }
               }

               Row {
                   id: formatRow
                   ToolButton {
                       id: boldButton
                       text: "\uE800" // icon-bold
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.bold
                       onClicked: document.bold = !document.bold
                   }
                   ToolButton {
                       id: italicButton
                       text: "\uE801" // icon-italic
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.italic
                       onClicked: document.italic = !document.italic
                   }
                   ToolButton {
                       id: underlineButton
                       text: "\uF0CD" // icon-underline
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.underline
                       onClicked: document.underline = !document.underline
                   }
                   ToolButton {
                       id: fontFamilyToolButton
                       text: qsTr("\uE808") // icon-font
                       font.family: "fontello"
                       font.bold: document.bold
                       font.italic: document.italic
                       font.underline: document.underline
                       onClicked: {
                           fontDialog.currentFont.family = document.fontFamily;
                           fontDialog.currentFont.pointSize = document.fontSize;
                           fontDialog.open();
                       }
                   }
                   ToolButton {
                       id: textColorButton
                       text: "\uF1FC" // icon-brush
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       onClicked: colorDialog.open()

                       Rectangle {
                           width: aFontMetrics.width + 3
                           height: 2
                           color: document.textColor
                           parent: textColorButton.contentItem
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.baseline: parent.baseline
                           anchors.baselineOffset: 6

                           TextMetrics {
                               id: aFontMetrics
                               font: textColorButton.font
                               text: textColorButton.text
                           }
                       }
                   }
                   ToolSeparator {
                       contentItem.visible: formatRow.y === alignRow.y
                   }
               }

               Row {
                   id: alignRow
                   ToolButton {
                       id: alignLeftButton
                       text: "\uE803" // icon-align-left
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.alignment == Qt.AlignLeft
                       onClicked: document.alignment = Qt.AlignLeft
                   }
                   ToolButton {
                       id: alignCenterButton
                       text: "\uE804" // icon-align-center
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.alignment == Qt.AlignHCenter
                       onClicked: document.alignment = Qt.AlignHCenter
                   }
                   ToolButton {
                       id: alignRightButton
                       text: "\uE805" // icon-align-right
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.alignment == Qt.AlignRight
                       onClicked: document.alignment = Qt.AlignRight
                   }
                   ToolButton {
                       id: alignJustifyButton
                       text: "\uE806" // icon-align-justify
                       font.family: "fontello"
                       focusPolicy: Qt.TabFocus
                       checkable: true
                       checked: document.alignment == Qt.AlignJustify
                       onClicked: document.alignment = Qt.AlignJustify
                   }
               }
           }
       }

    DocumentHandler {
        id: document
        document: textArea.textDocument
        cursorPosition: textArea.cursorPosition
        selectionStart: textArea.selectionStart
        selectionEnd: textArea.selectionEnd
        textColor: colorDialog.color
        //Component.onCompleted: document.load("qrc:/qml/aplicaciones/texteditor/texteditor.html")
        onLoaded: {
            textArea.text = text
        }
    }

    Flickable {
        id: flickable
        flickableDirection: Flickable.VerticalFlick
        y: herramientas.height
        height: parent.height -herramientas.height -20
        width: parent.width

        TextArea.flickable: TextArea {
            id: textArea
            textFormat: Qt.RichText
            wrapMode: TextArea.Wrap
            focus: true
            selectByMouse: true
            persistentSelection: true
            // Different styles have different padding and background
            // decorations, but since this editor is almost taking up the
            // entire window, we don't need them.
            leftPadding: 6
            rightPadding: 6
            topPadding: 0
            bottomPadding: 0
            background: null

            MouseArea {
                acceptedButtons: Qt.RightButton
                anchors.fill: parent
                onClicked: contextMenu.open()
            }

            onLinkActivated: Qt.openUrlExternally(link)
        }

        ScrollBar.vertical: ScrollBar {}
    }

    Menu {
        id: contextMenu

        MenuItem {
            text: qsTr("Copiar")
            enabled: textArea.selectedText
            onTriggered: textArea.copy()
        }
        MenuItem {
            text: qsTr("Cortar")
            enabled: textArea.selectedText
            onTriggered: textArea.cut()
        }
        MenuItem {
            text: qsTr("Pegar")
            enabled: textArea.canPaste
            onTriggered: textArea.paste()
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Font...")
            onTriggered: fontDialog.open()
        }

        MenuItem {
            text: qsTr("Color...")
            onTriggered: colorDialog.open()
        }
    }
}
