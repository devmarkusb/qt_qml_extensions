import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8


TextInput {
    id: control

    CfgControls {
        id: cfgSingleton
    }

    font: extFont.normal
    color: enabled ? extColors.activeC.text : extColors.disabledC.text
    renderType: ControlProp.obtainRenderType()

    selectionColor: control.enabled ? extColors.activeC.highlight : extColors.disabledC.highlight
    selectedTextColor : control.enabled ? extColors.activeC.highlightedText : extColors.disabledC.highlightedText

    selectByMouse: true

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
}
