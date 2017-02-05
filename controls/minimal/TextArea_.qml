//! In case you want a scrollable TextArea_, you need to type something like
/**
    Flickable {
        anchors.fill: parent
        clip: true
        ScrollBar.vertical: ScrollBar_ {}
        ScrollBar.horizontal: ScrollBar_ {}
        TextArea.flickable: TextArea_ {
            anchors.fill: parent
        }
    }

  */

import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import "../QC2_def" as QC2
import QtQuick 2.7


QC2.TextArea_ {
    id: control

    CfgControls {
        id: cfgSingleton
    }

    font: extFont.normal
    color: enabled ? extColors.activeC.text : extColors.disabledC.text
    // In text fields we regularly get strange artifacts when using native rendering on Windows.
    // This is not being observed for labels.
    renderType: Text.QtRendering//ControlProp.obtainRenderType()
    rightPadding: cfgSingleton.wScrollBarWidth * 1.5
    bottomPadding: rightPadding

    selectionColor: control.enabled ? extColors.activeC.highlight : extColors.disabledC.highlight
    selectedTextColor : control.enabled ? extColors.activeC.highlightedText : extColors.disabledC.highlightedText

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    background: TextFieldBackground {
    }
}
