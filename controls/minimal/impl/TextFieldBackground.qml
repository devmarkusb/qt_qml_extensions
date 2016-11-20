import QtQuick 2.7


Rectangle {
    color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
    border.color: control.enabled ? (control.activeFocus ? extColors.activeC.highlight : extColors.activeC.shadow) : extColors.disabledC.shadow
    border.width: control.activeFocus ? extSpacing.wBorderWidthSize2 : extSpacing.wBorderWidth
}
