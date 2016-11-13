import "../../layout"
import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4


Switch {
    property string offChar: qsTr("-")
    property string onChar: qsTr("+")
    property color offColor: "red"
    property color onColor: "green"
    property color charColor: "white"
    property real charYcorr: -1 //todo calculate


    style: SwitchStyle {
        groove: Rectangle {
            implicitWidth: extSpacing.charLikeWidth * 4 * 2
            implicitHeight: extSpacing.charLikeHeight * 1.5
            Rectangle {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: control.width / 2
                height: control.height
                color: control.checked ? onColor : offColor
                Text {
                    font.pointSize: Math.max(extSpacing.charLikeHeight, control.height)
                    color: charColor
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: charYcorr
                    text: onChar
                }
            }
            Item {
                width: control.width / 2
                height: control.height
                anchors.right: parent.right
                Text {
                    font.pointSize: Math.max(extSpacing.charLikeHeight, control.height)
                    color: charColor
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: charYcorr
                    text: offChar
                }
            }
            color: offColor
            border.color: extColors.activeC.shadow
            border.width: 1
        }

        handle: Rectangle {
            width: control.width / 2
            height: control.height
            color: extColors.activeC.midlight
            border.color: extColors.activeC.shadow
            border.width: 1
        }
    }
}

