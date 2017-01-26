import "../../_shared/impl"
import "../../_shared/impl/obtainButtonProps.js" as ButtonProp
import QtQuick 2.7


Rectangle {
    CfgControls {
        id: cfgSingleton
    }

    radius: cfgSingleton.rCommonControlRadius

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: {
                if (isSpecial)
                    ButtonProp.obtainButtonColor(control, Qt.darker(extColors.activeC.highlight), Qt.darker(extColors.activeC.highlight), Qt.darker(extColors.activeC.highlight), extColors.disabledC.midlight)
                else
                    ButtonProp.obtainButtonColor(control, extColors.activeC.mid, extColors.activeC.mid, extColors.activeC.mid, extColors.disabledC.midlight)
            }
        }
        GradientStop {
            position: 1.0
            color: {
                if (isSpecial)
                    ButtonProp.obtainButtonColor(control, Qt.lighter(extColors.activeC.highlight), extColors.activeC.midlight, Qt.darker(extColors.activeC.highlight), extColors.disabledC.button)
                else
                    ButtonProp.obtainButtonColor(control, extColors.activeC.midlight, extColors.activeC.light, extColors.activeC.mid, extColors.disabledC.light)
            }
        }
    }

    border.color: ButtonProp.obtainButtonBorderColor(control, extColors.activeC.shadow, extColors.activeC.highlight, extColors.activeC.shadow, extColors.disabledC.shadow)
    border.width: ButtonProp.obtainButtonBorderWidth(control)
}
