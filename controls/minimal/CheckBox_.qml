import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


CheckBox {
    id: control

    hoverEnabled: true

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    indicator: Rectangle {
        implicitWidth: cfgSingleton.wCheckBoxWidth
        implicitHeight: implicitWidth
        y: parent.height / 2 - height / 2
        radius: cfgSingleton.rCommonControlRadius
        border.width: extSpacing.wBorderWidth
        border.color: {
            if (control.enabled) {
                if (control.hovered || control.activeFocus)
                    extColors.activeC.highlight
                else
                    extColors.activeC.text
            }
            else
                extColors.disabledC.text;
        }
        color: {
            if (control.enabled && control.hovered && !control.down)
                extColors.activeC.button
            else
                "transparent"
        }

        Image {
            visible: control.checked
            width: cfgSingleton.wCheckBoxWidth
            height: width
            anchors.fill: parent
            anchors.margins: extSpacing.pix2space
            source: "../_shared/impl/checkmark.png"

            opacity: ControlProp.obtainDisablingOpacity(control.enabled)
        }
    }

    contentItem: Label_ {
        text: control.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width
    }
}
