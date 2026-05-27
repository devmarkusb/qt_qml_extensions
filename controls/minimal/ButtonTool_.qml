import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick
import QtQuick.Controls
import QtQuick.Effects


Button_ {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias imageSource: img.source
    property real squareSideLength: cfgSingleton.sqButtonSideLength
    property bool colorOverlayActive: true


    id: control

    CfgControls {
        id: cfgSingleton
    }

    hoverEnabled: true

    implicitWidth: squareSideLength
    implicitHeight: implicitWidth

    height: width

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Image {
            id: img

            anchors.fill: control
            sourceSize.width: width
            sourceSize.height: height

            opacity: ControlProp.obtainDisablingOpacity(control.enabled)
    }

    MultiEffect {
        anchors.fill: img
        source: img
        colorization: 1.0
        colorizationColor: extColors.activeC.text
        visible: colorOverlayActive
    }

    background: ButtonBackground {
    }
}
