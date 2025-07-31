import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("CloseButton")

    CloseButton{
        x: 50
        y: 50
        sourceActive: "active-close-icon-part.svg"
        sourceCommon: "common-close-icon-part.svg"
        duration: 100
        width:46
        height:46
        onClicked: Qt.quit()
    }
}
