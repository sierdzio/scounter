import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    property string text: "default"
    property string textColor: "#ffffffff"

    id: root
    height: 30
    width: 120
    color: "#00000000"

    Label {
        text: root.text
        color: root.textColor

        anchors.centerIn: parent

        font.family: "arial"
        font.pixelSize: 20
    }

    onTextChanged: changeAnimation.start();

    SequentialAnimation {
        id: changeAnimation
        ColorAnimation {
            target: root
            property: "color"
            from: "#00000000"
            to: "#88aaaaaa"
            duration: 250
        }
        ColorAnimation {
            target: root
            property: "color"
            from: "#88aaaaaa"
            to: "#00000000"
            duration: 250
        }
    }
}
