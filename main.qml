import QtQuick
import QtQuick.Controls 2.0
import QtQuick.Window

ApplicationWindow {
    id: mainWindow

    width: 2000
    height: 1500
    visible: true
    title: qsTr("Hello World")

    Item {
        focus: true
        Keys.onPressed: (event)=> {
                            if (event.key === Qt.Key_Up) {
                                event.accepted = true;

                                tankSpeed.value = tankSpeed.value +1
                            }

                            if (event.key === Qt.Key_Down) {
                                event.accepted = true;

                                tankSpeed.value = tankSpeed.value -1
                            }

                            if (event.key === Qt.Key_Right) {
                                event.accepted = true;

                                turretAngle.value = turretAngle.value +1
                            }

                            if (event.key === Qt.Key_Left) {
                                event.accepted = true;

                                turretAngle.value = turretAngle.value -1
                            }
        }
    }


    Timer {
        id: tankPositionTimer
        interval: 20
        running: true
        repeat: true
        onTriggered: {
            tank.x = tank.x + tank.v
        }

    }

    Slider {
        id: tankSpeed

        orientation: Qt.Horizontal

        x: 20
        y: 20
        from: -4
        to: 12

        value: 0
    }

    Slider {
        id: turretAngle

        orientation: Qt.Horizontal

        x: 20
        y: 40
        from: 0
        to: 360

        value: 0
    }

    Rectangle {
        id: tank

        scale: 1

        property real v: tankSpeed.value
        property real angle: 0

        rotation: 270

        width: 100
        height: 160
        color: "green"

        x: mainWindow.width/2 - width/2
        y: mainWindow.height/2 - height/2

        Rectangle {
            id: engine

            width: 40
            height: 60
            x: 20
            y: 20
            color: "darkGreen"
        }

        Rectangle {
            id: turret

            rotation: turretAngle.value

            width: 60
            height: 60
            x: 20
            y: 90
            radius: 20
            color: "lime"

            Rectangle {
                id: cannon
                color: "black"

                width: 10
                height: 70

                x: 25
                y: 35

            }
        }

    }
}
