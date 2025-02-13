import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import "../QC2_def" as QC2
import QtQuick 2.8
import QtQuick.Controls 2.2


QC2.TabButton_ {
    property bool customScaling: true


    id: control

    hoverEnabled: true

    contentItem: Label_ {
        id: label

        anchors.fill: control
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: control.text
    }

    function obtainTabButtonBorderWidth(control) {
        if (control.hovered && !control.pressed && !control.checked)
            return extSpacing.pix1space;
        else
            return extSpacing.pix0space;
    }

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight
    width: customScaling ?  contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor : undefined

    opacity: 1.0

    background: Rectangle {
        radius: cfgSingleton.rCommonControlRadius

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: ButtonProp.obtainButtonColor(control, extColors.activeC.mid, extColors.activeC.mid, extColors.activeC.alternateBase, extColors.disabledC.midlight)
            }
            GradientStop {
                position: 1.0
                color: ButtonProp.obtainButtonColor(control, extColors.activeC.midlight, extColors.activeC.light, extColors.activeC.base, extColors.disabledC.button)
            }
        }

        border.width: obtainTabButtonBorderWidth(control)
        border.color: extColors.activeC.highlight
    }
}
