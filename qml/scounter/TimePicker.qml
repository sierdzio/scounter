import QtQuick 2.2
import QtQuick.Controls 1.2

Row {
    property string hours: hoursField.text
    property string minutes: minutesFiled.text
    property string textColor: "#ff000000"

    TextField {
        id: hoursField
        width: 60
        height: 40
        textColor: parent.textColor
        text: hours
        font.pixelSize: 24
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        width: 20
        height: 40
        text: ":"
        font.pixelSize: 24
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: textColor
    }

    TextField {
        id: minutesFiled
        width: 60
        height: 40
        textColor: parent.textColor
        text: minutes
        font.pixelSize: 24
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
