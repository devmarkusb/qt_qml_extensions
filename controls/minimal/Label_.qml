import "../QC2_def"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


Label_ {
    id: control

    font: extFont.normal
    color: enabled ? extColors.activeC.text : extColors.disabledC.text
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
}
