import Mixxx 1.0 as Mixxx
import QtQuick
import QtQuick.Controls
import QtQuick.Window

ApplicationWindow {
    id: root

    property int displayedProgress: 0

    color: startupScreen.backgroundColor
    height: 1008
    menuBar: mainWindowLoader.item ? mainWindowLoader.item.menuBar : null
    minimumHeight: 668
    minimumWidth: 1280
    visible: true
    width: 1792

    function updateVisibility() {
        if (!Mixxx.Core.ready) {
            return;
        }
        root.visibility = Mixxx.Config.configStartInFullscreenKey
                ? Window.FullScreen
                : Window.Windowed;
    }

    function updateProgress() {
        if (!Mixxx.Core.ready) {
            displayedProgress = Math.max(displayedProgress,
                                         Mixxx.Core.initializationProgress);
        } else if (mainWindowLoader.status === Loader.Ready) {
            displayedProgress = 100;
        } else {
            displayedProgress = Math.max(displayedProgress,
                                         65 + Math.round(mainWindowLoader.progress * 34));
        }
    }

    function handleMainWindowLoaderStatus() {
        root.updateProgress()
        if (mainWindowLoader.status === Loader.Error) {
            console.error("Failed to load the LateNightQML main window")
            Qt.quit()
        }
    }

    Connections {
        target: Mixxx.Core

        function onInitializationProgressChanged() {
            root.updateProgress();
        }
        function onReadyChanged() {
            root.updateProgress();
            root.updateVisibility();
        }
    }

    Loader {
        id: mainWindowLoader

        anchors.fill: parent
        active: Mixxx.Core.ready
        asynchronous: true

        onProgressChanged: root.updateProgress()
        onStatusChanged: root.handleMainWindowLoaderStatus()

        sourceComponent: Component {
            MainWindow {
                applicationWindow: root
                anchors.fill: parent
            }
        }
    }

    StartupScreen {
        id: startupScreen

        anchors.fill: parent
        opacity: mainWindowLoader.status === Loader.Ready ? 0 : 1
        progress: root.displayedProgress
        visible: opacity > 0

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutQuad
            }
        }
    }

    // ===== Sinatra · Learn spike (Hito 001-D): indicador de BPM igualados =====
    // Los ControlProxy se crean SOLO cuando el motor está listo (Loader), para que
    // resuelvan los controles del motor en vivo (si no, quedan pegados a 0).
    Loader {
        id: sinatraLearnLoader

        z: 9999
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        active: Mixxx.Core.ready && (mainWindowLoader.status === Loader.Ready)

        sourceComponent: Component {
            Rectangle {
                id: sinatraBpmMatch

                readonly property real bpm1: deck1Bpm.value
                readonly property real bpm2: deck2Bpm.value
                readonly property bool matched: bpm1 > 0 && bpm2 > 0 && Math.abs(bpm1 - bpm2) < 0.5

                width: 380
                height: 88
                radius: 12
                color: matched ? "#0f3d1c" : "#3a1414"
                border.color: matched ? "#18d86b" : "#18b8d8"
                border.width: 2
                opacity: 0.94

                Mixxx.ControlProxy { id: deck1Bpm; group: "[Channel1]"; key: "bpm" }
                Mixxx.ControlProxy { id: deck2Bpm; group: "[Channel2]"; key: "bpm" }

                Column {
                    anchors.centerIn: parent
                    spacing: 3

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: sinatraBpmMatch.matched ? "✓ TEMPOS IGUALADOS" : "✗ ajusta el tempo"
                        color: sinatraBpmMatch.matched ? "#3cf08a" : "#18b8d8"
                        font.pixelSize: 22
                        font.bold: true
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "SINATRA Learn · A " + sinatraBpmMatch.bpm1.toFixed(1)
                              + "  ·  B " + sinatraBpmMatch.bpm2.toFixed(1) + " BPM"
                        color: "#cfe6ff"
                        font.pixelSize: 13
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        updateProgress();
        updateVisibility();
    }
}
