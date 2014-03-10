import QtQml 2.2
import QtQuick 2.2
import QtQuick.Controls 1.2
import Qt.labs.settings 1.0
import SCounter 1.0

ApplicationWindow {
    property bool firstRun: true
    property int defaultMargin: 15
    property int defaultBorderWidth: 2
    property int defaultRadius: 10
    property string backgroundColor: "#22000000"
    property string defaultBorderColor: "#99444444"
    property string defaultTextColor: "#ffaaaaaa"

    id: root
    title: qsTr("SCounter")
    width: 640
    height: 480

    Settings {
        property alias firstRun: root.firstRun
        property alias date: calendar.selectedDate
        property alias hours: timePicker.hours
        property alias minutes: timePicker.minutes
    }

    Rectangle {
        id: mainRect
        state: firstRun? "dateSelectionShown" : "countingPaneShown"
        anchors.fill: parent
        color: "#ff111111"

        Rectangle {
            id: countingPane
            visible: true
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: parent.width

            color: backgroundColor

            Grid {
                anchors.fill: parent
                anchors.margins: defaultMargin
                columns: 2
                spacing: defaultMargin

                TimeLabel {
                    text: qsTr("Weeks")
                    color: defaultTextColor
                }

                TimeLabel {
                    id: weeks
                    text: "default"
                    color: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Days")
                    color: defaultTextColor
                }

                TimeLabel {
                    id: days
                    text: "default"
                    color: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Hours")
                    color: defaultTextColor
                }

                TimeLabel {
                    id: hours
                    text: "default"
                    color: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Minutes")
                    color: defaultTextColor
                }

                TimeLabel {
                    id: minutes
                    text: "default"
                    color: defaultTextColor
                }

                TimeLabel {
                    text: qsTr("Seconds")
                    color: defaultTextColor
                }

                TimeLabel {
                    id: seconds
                    text: "default"
                    color: defaultTextColor
                }

                Rectangle {
                    height: 30
                    width: 120
                    color: "#00000000"
                }

                Button {
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

        Rectangle {
            id: dateSelection
            anchors.top: parent.top
            anchors.left: countingPane.right
            anchors.bottom: parent.bottom
            width: mainRect.width

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

        states: [
            State {
                name: "dateSelectionShown"
                AnchorChanges {
                    target: countingPane
                    anchors.right: mainRect.left
                }
            },
            State {
                name: "countingPaneShown"
                AnchorChanges {
                    target: countingPane
                    anchors.right: mainRect.right
                }
            }
        ]

        transitions: Transition {
            AnchorAnimation {
                duration: 300
            }
        }
    }
}
