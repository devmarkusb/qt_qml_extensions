import "impl"
import "../QC2_def"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


TextField_ {
    id: control

    CfgControls {
        id: cfgSingleton
    }

    font: extFont.normal
    color: enabled ? extColors.activeC.text : extColors.disabledC.text
    // In text fields we regularly get strange artifacts when using native rendering on Windows.
    // This is not being observed for labels.
    renderType: Text.QtRendering//ControlProp.obtainRenderType()

    selectionColor: control.enabled ? extColors.activeC.highlight : extColors.disabledC.highlight
    selectedTextColor : control.enabled ? extColors.activeC.highlightedText : extColors.disabledC.highlightedText

    selectByMouse: true

    implicitWidth: cfgSingleton.wTextFieldWidth
    implicitHeight: cfgSingleton.hTextFieldHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    background: TextFieldBackground {
    }
}
