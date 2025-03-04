import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8
import QtQuick.Controls 2.2


Button {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias horizontalTextAlignment: label.horizontalAlignment
    property real fontSizeFactor: 1.0
    property bool fontBold: false


    id: control

    hoverEnabled: true

    CfgControls {
        id: cfgSingleton
    }

    implicitWidth: Math.max(cfgSingleton.wButtonWidth, contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor)
    implicitHeight: cfgSingleton.hButtonHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Label_ {
        id: label

        isSpecial: control.isSpecial
        fontSizeFactor: control.fontSizeFactor
        font.bold: fontBold
        anchors.fill: control
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: horizontalTextAlignment === Text.AlignLeft ? extSpacing.charLikeWidth : 0
        rightPadding: horizontalTextAlignment === Text.AlignRight ? extSpacing.charLikeWidth : 0

        text: control.text
    }

    background: ButtonBackground {
    }
}
