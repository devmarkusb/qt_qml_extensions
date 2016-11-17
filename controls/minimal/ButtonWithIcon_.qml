import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias imageSource: img.source


    id: control

    hoverEnabled: true

    contentItem: Row {
        leftPadding: extSpacing.space2
        spacing: leftPadding
        anchors.fill: control

        Image {
            id: img

            height: control.height - 2 * extSpacing.wBorderWidthSize2
            width: height
            y: extSpacing.wBorderWidthSize2

            sourceSize.width: width
            sourceSize.height: height

            opacity: ControlProp.obtainOpacity(control.enabled)
        }

        Label_ {
            id: label

            height: control.height

            verticalAlignment: Text.AlignVCenter

            text: control.text
        }
    }

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight
    implicitWidth: Math.max(label.implicitWidth, cfgSingleton.wButtonWidth)

    background: ButtonBackground {
    }
}
