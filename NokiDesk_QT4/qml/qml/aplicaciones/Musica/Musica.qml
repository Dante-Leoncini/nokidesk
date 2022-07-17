import QtQuick 1.1
import com.nokia.symbian 1.1
import "Storage.js" as Storage

Item { //Block de notas de windows7
  x: 8; y: 30; width: maxi(2) -16
  height: parent.parent.height -38
    property Item musicPickerPage

    Player {
        id: player
        onPlaylistLoaded: {
            if (player.playlistModel.count == 0) {
                pageStack.clear()
                pageStack.push([controlPage, playlistPage, musicPickerPage])
            }
        }
        Component.onCompleted: {
            Storage.initialize()

            Storage.getPlaylist(playlist)
            playlistLoaded()

            var res = Storage.getSetting("volume")
            if (res != "Unknown")
                volume = parseFloat(res)

            res = Storage.getSetting("repeat")
            if (res != "Unknown")
                repeat = res == "true"

            res = Storage.getSetting("shuffle")
            if (res != "Unknown")
                shuffle = res == "true"

            res = Storage.getSetting("index")
            if (res != "Unknown") {
                index = parseInt(res)
                refreshSong()
            }
        }

        Component.onDestruction: {
            Storage.setSetting("volume", volume)
            Storage.setSetting("repeat", repeat)
            Storage.setSetting("shuffle", shuffle)
            Storage.setSetting("index", index)
            Storage.setPlaylist(playlist)
        }

        Timer {
            id: timer
            interval: 300
            repeat: true
            onTriggered: {
                switch (mediakeysobserver.key) {
                case MediaKeysObserver.EVolIncKey:
                    player.volume += 0.1
                    break

                case MediaKeysObserver.EVolDecKey:
                    player.volume -= 0.1
                    break
                }
            }
        }
    }

    PageStack {
        id: pageStack

        anchors.top: statusbar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: toolbar.top

        ControlsPage {
            id: controlPage

            playlistVisible:  !inPortrait
            backgroundImage: inPortrait ?  "images/bg_prt.png" : "images/bg_lsc.png"
        }

        PlaylistPage {
            id: playlistPage
            backgroundImage: inPortrait ?  "images/bg_prt.png" : "images/bg_lsc.png"
        }

    }

    //Set the image manually as there is no binding to musicPickerPage created
    //dynamically below
    onInPortraitChanged:{
        if (musicPickerPage)
            musicPickerPage.backgroundImage = inPortrait ?  "images/bg_prt.png" : "images/bg_lsc.png"
    }
}
//![0]
