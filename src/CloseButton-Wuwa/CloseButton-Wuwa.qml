import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15


Item{

    required property url sourceCommon
    required property url sourceActive
    property int duration: 100
    signal clicked()

    property bool isPressed: false
    property bool isHover: false

    id: root
    width: 46
    height: 46

    state: !isHover ? "common" : isPressed ? "press" : "active"
    states: [
        State {
            name: "common"
            PropertyChanges {
                target: part1
                source: root.sourceCommon
                x: 0
                y: 0
            }
            PropertyChanges {
                target: part2
                source: root.sourceCommon
                x: 25 * root.width / 46
                y: 0
            }
            PropertyChanges {
                target: part3
                source: root.sourceCommon
                x: 0
                y: 25 * root.height / 46
            }
            PropertyChanges {
                target: part4
                source: root.sourceCommon
                x: 25 * root.width / 46
                y: 25 * root.height / 46
            }
        },
        State {
            name: "active"
            PropertyChanges {
                target: part1
                source: root.sourceActive
                x: -4 * root.width / 46
                y: -4 * root.height / 46
            }
            PropertyChanges {
                target: part2
                source: root.sourceActive
                x: 29 * root.width / 46
                y: -4 * root.height / 46
            }
            PropertyChanges {
                target: part3
                source: root.sourceActive
                x: -4 * root.width / 46
                y: 29 * root.height / 46
            }
            PropertyChanges {
                target: part4
                source: root.sourceActive
                x: 29 * root.width / 46
                y: 29 * root.height / 46
            }
        },
        State {
            name: "press"
            PropertyChanges {
                target: part1
                source: root.sourceActive
                x: 4 * root.width / 46
                y: 4 * root.height / 46
            }
            PropertyChanges {
                target: part2
                source: root.sourceActive
                x: 21 * root.width / 46
                y: 4 * root.height / 46
            }
            PropertyChanges {
                target: part3
                source: root.sourceActive
                x: 4 * root.width / 46
                y: 21 * root.height / 46
            }
            PropertyChanges {
                target: part4
                source: root.sourceActive
                x: 21 * root.width / 46
                y: 21 * root.height / 46
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"
            NumberAnimation{
                target: part1
                properties: "x,y"
                duration: root.duration
            }
            NumberAnimation{
                target: part2
                properties: "x,y"
                duration: root.duration
            }
            NumberAnimation{
                target: part3
                properties: "x,y"
                duration: root.duration
            }
            NumberAnimation{
                target: part4
                properties: "x,y"
                duration: root.duration
            }
        }
    ]

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged: root.isHover = containsMouse
        onPressed: root.isPressed = true
        onReleased: root.isPressed = false
        onClicked: root.clicked()
    }

    Image{
        id: part1
        x: 0
        y: 0
        rotation: 180
        width: (root.width-4 * root.width / 46) / 2
        height: (root.height-4 * root.height / 46) / 2
        source: root.sourceCommon
    }
    Image{
        id: part2
        x: 25 * root.width / 46
        y: 0
        rotation: 270
        width: (root.width-4 * root.width / 46) / 2
        height: (root.height-4 * root.height / 46) / 2
        source: root.sourceCommon
    }
    Image{
        id: part3
        x: 0
        y: 25 * root.height / 46
        rotation: 90
        width: (root.width-4 * root.width / 46) / 2
        height: (root.height-4 * root.height / 46) / 2
        source: root.sourceCommon
    }
    Image{
        id: part4
        x: 25 * root.width / 46
        y: 25 * root.height / 46
        rotation: 0
        width: (root.width-4 * root.width / 46) / 2
        height: (root.height-4 * root.height / 46) / 2
        source: root.sourceCommon
    }
}
