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
    property bool colorOverlayActive: false


    id: control

    hoverEnabled: true

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Row {
        leftPadding: extSpacing.space1
        spacing: leftPadding
        anchors.fill: control

        Image {
            id: img

            height: control.height - 2 * extSpacing.pixBorderWidthSize2
            width: height
            y: extSpacing.pixBorderWidthSize2

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

        Label_ {
            id: label

            //todo
            // isSpecial: control.isSpecial
            height: control.height
            verticalAlignment: Text.AlignVCenter

            text: control.text
        }
    }

    background: ButtonBackground {
    }
}
