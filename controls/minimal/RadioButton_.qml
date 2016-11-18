import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


RadioButton {
    id: control

    hoverEnabled: true

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    indicator: Rectangle {
        implicitWidth: cfgSingleton.wRadioButtonWidth
        implicitHeight: implicitWidth
        y: parent.height / 2 - height / 2
        radius: cfgSingleton.rRadioButtonRadius
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
            if (control.enabled && control.hovered && !(control.down || control.checked))
                extColors.activeC.button
            else
                "transparent"
        }

        Rectangle {
            visible: control.checked
            width: cfgSingleton.wRadioButtonInnerWidth
            height: width
            anchors.centerIn: parent
            radius: cfgSingleton.rRadioButtonInnerRadius
            color: {
                if (control.enabled) {
                    if (control.down || control.checked)
                        extColors.activeC.text
                    else
                        "transparent"
                }
                else
                    extColors.disabledC.text;
            }
        }
    }

    contentItem: Label_ {
        text: control.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width
    }
}
