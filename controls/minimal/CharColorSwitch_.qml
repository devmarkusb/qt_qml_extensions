//todo port to QC2, styling works a bit different
import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import QtQuick 2.8
import QtQuick.Controls 2.2


Switch {
    property string offChar: qsTr("-")
    property string onChar: qsTr("+")
    property color offColor: "red"
    property color onColor: "green"
    property color charColor: "white"
    property real charYcorr: -1 //todo calculate
    property alias on: control.checked
    // readonly property alias hovered: mousearea.containsMouse
    // readonly property alias down: mousearea.pressed
    // readonly property alias pressed: mousearea.pressed


    id: control
    CfgControls {
        id: cfgSingleton
    }

    // style: SwitchStyle {
    //     groove: Rectangle {
    //         implicitHeight: cfgSingleton.hSwitchHeight
    //         implicitWidth: implicitHeight * 2
    //         Rectangle {
    //             anchors.top: parent.top
    //             anchors.left: parent.left
    //             anchors.bottom: parent.bottom
    //             width: control.width / 2
    //             height: control.height
    //             color: control.checked ? onColor : offColor
    //             Label {
    //                 elide: Text.ElideRight
    //                 font.family: extFont.normal.family
    //                 font.pixelSize: control.height
    //                 color: charColor
    //                 anchors.centerIn: parent
    //                 anchors.verticalCenterOffset: charYcorr
    //                 text: onChar
    //             }
    //         }
    //         Item {
    //             width: control.width / 2
    //             height: control.height
    //             anchors.right: parent.right
    //             Label {
    //                 elide: Text.ElideRight
    //                 font.family: extFont.normal.family
    //                 font.pixelSize: control.height
    //                 color: charColor
    //                 anchors.centerIn: parent
    //                 anchors.verticalCenterOffset: charYcorr
    //                 text: offChar
    //             }
    //         }
    //         color: offColor
    //         border.color: ButtonProp.obtainPressableControlColor(control, extColors.activeC.shadow, extColors.activeC.highlight, extColors.activeC.shadow, extColors.disabledC.shadow)
    //         border.width: extSpacing.pixBorderWidth
    //     }
    //
    //     handle: Rectangle {
    //         width: control.width / 2
    //         height: control.height
    //         color: extColors.activeC.midlight
    //         border.color: ButtonProp.obtainPressableControlColor(control, extColors.activeC.shadow, extColors.activeC.highlight, extColors.activeC.shadow, extColors.disabledC.shadow)
    //         border.width: extSpacing.pixBorderWidth
    //     }
    // }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }
}
