import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtGraphicalEffects 1.0
import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias imageSource: img.source
    property real squareSideLength: cfgSingleton.sqButtonSideLength


    id: control

    CfgControls {
        id: cfgSingleton
    }

    hoverEnabled: true

    implicitWidth: squareSideLength
    implicitHeight: width

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Image {
        id: img

        anchors.fill: control
        sourceSize.width: width
        sourceSize.height: height

        opacity: ControlProp.obtainDisablingOpacity(control.enabled)
        ColorOverlay {
            anchors.fill: img
            source: img
            color: extColors.activeC.text
        }
    }

    background: ButtonBackground {
    }
}
