import "../../_shared/impl"
import QtQuick


Rectangle {
    CfgControls {
        id: cfgSingleton
    }


    radius: cfgSingleton.rCommonControlRadius

    color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
    border.color: control.enabled ? (control.activeFocus ? extColors.activeC.highlight : extColors.activeC.shadow) : extColors.disabledC.shadow
    border.width: control.activeFocus ? extSpacing.pixBorderWidthSize2 : extSpacing.pixBorderWidth
}
