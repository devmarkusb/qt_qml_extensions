//todo port to QC2, styling works a bit different
import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import QtQuick 2.8
import QtQuick.Controls 2.2


Switch {
    id: control

    property string offChar: qsTr("-")
    property string onChar: qsTr("+")
    property color offColor: "red"
    property color onColor: "green"
    property color charColor: "white"
    property real charYcorr: -1 //todo calculate
    property alias on: control.checked
    readonly property alias isHovered: mousearea.containsMouse
    readonly property alias isDown: mousearea.pressed
    readonly property alias isPressed: mousearea.pressed

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hSwitchHeight
    implicitWidth: implicitHeight * 2

    indicator: Rectangle {
        id: groove
        width: control.width
        height: control.height
        color: "transparent"
        border.color: ButtonProp.obtainPressableControlColor(control,
            extColors.activeC.shadow,
            extColors.activeC.highlight,
            extColors.activeC.shadow,
            extColors.disabledC.shadow)
        border.width: extSpacing.pixBorderWidth

        // left (ON) half
        Rectangle {
            width: groove.width / 2
            height: groove.height
            x: 0
            color: onColor
            Label {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: charYcorr
                text: onChar
                color: charColor
                font.family: extFont.normal.family
                font.pixelSize: groove.height
            }
            visible: control.checked // only visible when ON
        }

        // right (OFF) half
        Rectangle {
            width: groove.width / 2
            height: groove.height
            x: groove.width / 2
            color: offColor
            Label {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: charYcorr
                text: offChar
                color: charColor
                font.family: extFont.normal.family
                font.pixelSize: groove.height
            }
            visible: !control.checked // only visible when OFF
        }

        Rectangle {
            id: handle
            width: groove.width / 2
            height: groove.height
            x: control.checked ? groove.width / 2 : 0
            y: 0
            color: extColors.activeC.midlight
            border.color: ButtonProp.obtainPressableControlColor(control,
                extColors.activeC.shadow,
                extColors.activeC.highlight,
                extColors.activeC.shadow,
                extColors.disabledC.shadow)
            border.width: extSpacing.pixBorderWidth
            Behavior on x { NumberAnimation { duration: 150; easing.type: Easing.InOutQuad } }
        }
    }

    contentItem: Item {}

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }
}
