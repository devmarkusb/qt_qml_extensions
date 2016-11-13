import "../QC2_def"
import QtQuick 2.7


TextField_ {
    id: root

    background: Rectangle {
        implicitWidth: extSpacing.charLikeWidth * 20
        implicitHeight: extSpacing.charLikeHeight
        color: root.enabled ? extColors.activeC.base : extColors.disabledC.base
        border.color: root.enabled ? (root.activeFocus ? extColors.activeC.highlight : extColors.activeC.shadow) : extColors.disabledC.shadow
        border.width: root.activeFocus ? extSpacing.pix2space : extSpacing.pix1space
    }
}
