import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import Qt5Compat.GraphicalEffects
import QtQuick 2.8
import QtQuick.Controls 2.2


Button {
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

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Image {
            id: img

            anchors.fill: control
            sourceSize.width: width
            sourceSize.height: height

            opacity: ControlProp.obtainDisablingOpacity(control.enabled)
    }

    ColorOverlay {
        anchors.fill: img
        source: img
        color: extColors.activeC.text
        visible: colorOverlayActive
    }

    background: ButtonBackground {
    }
}
