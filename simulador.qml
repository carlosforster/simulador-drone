import QtQuick 2.15
import QtQuick.Controls 2.15
import QtWebEngine 1.7

ApplicationWindow {
    visible: true
    width: 800
    height: 600

    WebEngineView {
        id: webview
        anchors.fill: parent
        url: "https://carlosforster.github.io/simulador-drone/"
        onLoadingChanged: function(loadRequest) {
            if (loadRequest.status === WebEngineLoadRequest.LoadSucceededStatus) {
                // Execute JavaScript after the page has loaded
                webview.runJavaScript("document.addEventListener('keydown', function(event) { console.log(event.key); });");
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Button {
            text: "Up"
            onClicked: {
                webview.runJavaScript("camera.position.y+=0.5");
            }
        }

        Button {
            text: "Down"
            onClicked: {
                webview.runJavaScript("camera.position.y-=0.5");
            }
        }
    }

    Column {
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 10

        Text {
            id: posX
            text: "X: "
        }

        Text {
            id: posY
            text: "Y: "
        }

        Timer {
            interval: 1000 // update every second
            running: true
            repeat: true
            onTriggered: {
                webview.runJavaScript("camera.position.x", function(result) {
                    posX.text = "X: " + result;
                });
                webview.runJavaScript("camera.position.z", function(result) {
                    posY.text = "Y: " + result;
                });
            }
        }
    }
}
