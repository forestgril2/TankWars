import QtQuick
import QtQuick.Controls 2.0
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

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

        property real v: tankSpeed.value
        property real angle: 0

        rotation: 270

        width: 50
        height: 80
        color: "green"
        x: 100
        y: 200

        Rectangle {
            id: engine

            width: 20
            height: 30
            x: 10
            y: 10
            color: "darkGreen"
        }

        Rectangle {
            id: turret

            rotation: turretAngle.value

            width: 30
            height: 30
            x: 10
            y: 45
            radius: 15
            color: "lime"

            Rectangle {
                id: cannon
                color: "black"

                width: 5
                height: 35

                x: 12.5
                y: 17.5

            }
        }

    }
}
