import "../QC2_def" as QC2
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


QC2.Label_ {
    property bool isSpecial: false


    id: control

    font: extFont.normal
    color: {
        if (isSpecial)
            enabled ? extColors.activeC.highlightedText : extColors.disabledC.highlightedText
        else
            enabled ? extColors.activeC.text : extColors.disabledC.text
    }
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
}
