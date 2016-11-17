import "../QC2_def"
import QtQuick 2.7


TextField_ {
    id: control

    font: extFont.normal

    selectionColor: control.enabled ? extColors.activeC.highlight : extColors.disabledC.highlight
    selectedTextColor : control.enabled ? extColors.activeC.highlightedText : extColors.disabledC.highlightedText

    selectByMouse: true

    background: Rectangle {
        implicitWidth: extSpacing.charLikeWidth * 20
        implicitHeight: extSpacing.charLikeHeight
        color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
        border.color: control.enabled ? (control.activeFocus ? extColors.activeC.highlight : extColors.activeC.shadow) : extColors.disabledC.shadow
        border.width: control.activeFocus ? extSpacing.wBorderWidthSize2 : extSpacing.wBorderWidth
    }
}
