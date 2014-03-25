import QtQml 2.2
import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Particles 2.0
import Qt.labs.settings 1.0
import SCounter 1.0

Rectangle {
    property bool firstRun: true
    property int defaultMargin: 15
    property int defaultBorderWidth: 2
    property int defaultRadius: 10
    property string backgroundColor: "#ff111111"
    property string defaultBorderColor: "#99444444"
    property string defaultTextColor: "#ffaaaaaa"
    property string entryAdditionalColor: "#55aaaaaa"

    id: root
    width: 640
    height: 480
    color: "#025151"

    Settings {
        property alias firstRun: root.firstRun
        property alias date: calendar.selectedDate
        property alias hours: timePicker.hours
        property alias minutes: timePicker.minutes
    }

    Flipable {
        id: mainRect
        anchors.fill: parent

        Component.onCompleted: {
            if (firstRun) {
                mainRect.state = "dateSelectionShown";
                countingPane.enabled = false;
            } else {
                dateSelection.enabled = false;
            }
        }

        front: Rectangle {
            id: countingPane
            anchors.fill: parent
            color: backgroundColor

            ParticleSystem {
                id: particleSystem
                anchors.fill: parent

                Emitter {
                    enabled: true
                    width: parent.width
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    emitRate: 25

                    lifeSpan: 2800
                    lifeSpanVariation: 800

                    velocity: AngleDirection {
                        magnitude: 300
                        magnitudeVariation: 80
                        angle: 270
                        angleVariation: 40
                    }

                    acceleration: AngleDirection {
                        magnitude: 20
                        angle: 0
                        angleVariation: 20
                    }

                    velocityFromMovement: 12
                    size: 20
                }

                Turbulence {
                    anchors.fill: parent
                    strength: 8
                }

                ItemParticle {
                    delegate: Rectangle {
                        width: 15
                        height: width
                        radius: 5
                        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.2 + Math.random() - 0.4);
                    }
                }

                Gravity {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50

                    magnitude: 80
                    angle: 180
                }

                Gravity {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50

                    magnitude: 80
                    angle: 0
                }
            }

            Grid {
                anchors.fill: parent
                anchors.margins: defaultMargin
                columns: 2
                spacing: defaultMargin

                TimeLabel {
                    text: qsTr("Weeks")
                    textColor: defaultTextColor
                    color: entryAdditionalColor
                    isHighlightedEntry: true
                }

                TimeLabel {
                    id: weeks
                    text: "default"
                    textColor: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Days")
                    textColor: defaultTextColor
                    color: entryAdditionalColor
                    isHighlightedEntry: true
                }

                TimeLabel {
                    id: days
                    text: "default"
                    textColor: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Hours")
                    textColor: defaultTextColor
                    color: entryAdditionalColor
                    isHighlightedEntry: true
                }

                TimeLabel {
                    id: hours
                    text: "default"
                    textColor: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Minutes")
                    textColor: defaultTextColor
                    color: entryAdditionalColor
                    isHighlightedEntry: true
                }

                TimeLabel {
                    id: minutes
                    text: "default"
                    textColor: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Seconds")
                    textColor: defaultTextColor
                    color: entryAdditionalColor
                    isHighlightedEntry: true
                }

                TimeLabel {
                    id: seconds
                    text: "default"
                    textColor: defaultTextColor
                }

                Rectangle {
                    height: 30
                    width: 120
                    color: "#00000000"
                }

                Button {
                    id: buttonGoToDateSetting
                    height: 30
                    width: 120
                    text: qsTr("Set date")

                    onClicked: mainRect.state = "dateSelectionShown";
                }
            }

            Timer {
                id: timer
                repeat: true
                running: countingPane.visible
                triggeredOnStart: true
                interval: 1000

                onTriggered: {
                    var date = calendar.selectedDate;
                    var selectedDate = date;
                    selectedDate.setHours(timePicker.hours);
                    selectedDate.setMinutes(timePicker.minutes);

                    weeks.text = DateHandler.weeksTo(selectedDate);
                    days.text = DateHandler.daysTo(selectedDate);
                    hours.text = DateHandler.hoursTo(selectedDate);
                    minutes.text = DateHandler.minutesTo(selectedDate);
                    seconds.text = DateHandler.secondsTo(selectedDate);
                }
            }
        }

        back: Rectangle {
            id: dateSelection
            anchors.fill: parent

            color: backgroundColor

            Calendar {
                id: calendar
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: defaultMargin
                height: 300
                visible: true
            }

            TimePicker {
                id: timePicker
                anchors.top: calendar.bottom
                anchors.right: parent.right
                anchors.margins: defaultMargin
                textColor: defaultTextColor
            }

            Button {
                id: dateButton
                anchors.top: timePicker.bottom
                anchors.right: parent.right
                anchors.margins: defaultMargin
                height: 30
                width: 120
                text: qsTr("Done")

                onClicked: {
                    firstRun = false;
                    mainRect.state = "countingPaneShown";
                }
            }
        }

        transform: Rotation {
            id: rotation
            origin.x: mainRect.width/2
            origin.y: mainRect.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: [
            State {
                name: "countingPaneShown"
                PropertyChanges {
                    target: rotation
                    angle: 0
                }

                PropertyChanges {
                    target: countingPane
                    enabled: true
                }

                PropertyChanges {
                    target: dateSelection
                    enabled: false
                }
            },

            State {
                name: "dateSelectionShown"
                PropertyChanges {
                    target: rotation
                    angle: 180
                }

                PropertyChanges {
                    target: countingPane
                    enabled: false
                }

                PropertyChanges {
                    target: dateSelection
                    enabled: true
                }
            }
        ]

        transitions: Transition {
            NumberAnimation {
                target: rotation
                property: "angle"
                duration: 300
            }
        }
    }
}
