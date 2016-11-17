import "../../_shared/impl/obtainButtonProps.js" as ButtonProp
import QtQuick 2.7


Rectangle {
    radius: 0

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: {
                if (isSpecial)
                    ButtonProp.obtainButtonColor(control, extColors.activeC.highlight, extColors.activeC.highlight, extColors.activeC.highlight, extColors.disabledC.midlight)
                else
                    ButtonProp.obtainButtonColor(control, extColors.activeC.mid, extColors.activeC.mid, extColors.activeC.mid, extColors.disabledC.midlight)
            }
        }
        GradientStop {
            position: 1.0
            color: ButtonProp.obtainButtonColor(control, extColors.activeC.midlight, extColors.activeC.light, extColors.activeC.mid, extColors.disabledC.button)
        }
    }

    border.width: ButtonProp.obtainButtonBorderWidth(control)
    border.color: ButtonProp.obtainButtonBorderColor(control, extColors.activeC.shadow, extColors.activeC.highlight, extColors.activeC.shadow, extColors.disabledC.shadow)
}
