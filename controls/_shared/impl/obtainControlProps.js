//####################################################################################################################
// opacity

//! Additional opacity for disabled control state.
/** It is understood optional, because all controls should provide
    some disabled color anyway. That is, disabling should already make a difference if there is no difference in
    opacity. For release you might want some additional opacity < 1.0, for testing you might want to check how 1.0
    looks like.*/
function obtainOptionalDisablingOpacity(enabled) {
    return enabled ? extColors.activeC.controlOptionalOpacity : extColors.disabledC.controlOptionalOpacity;
}

//! At some places you might always need an opacity for disabling, e.g. for images, where there is no easy control
//! over color.
function obtainDisablingOpacity(enabled) {
    return enabled ? extColors.activeC.controlOpacity : extColors.disabledC.controlOpacity;
}


//####################################################################################################################
// color

function obtainBaseColor(enabled) {
    return enabled ? extColors.activeC.base : extColors.disabledC.base;
}

function obtainBaseAlternateColor(enabled) {
    return enabled ? extColors.activeC.alternateBase : extColors.disabledC.alternateBase;
}

function obtainBorderColor(enabled) {
    return enabled ? extColors.activeC.shadow : extColors.disabledC.shadow;
}

function obtainWindowColor(enabled) {
    return enabled ? extColors.activeC.window : extColors.disabledC.window;
}


//####################################################################################################################
// font

function obtainRenderType() {
    return Qt.platform.os === "windows" || Qt.platform.os === "winrt" ? Text.NativeRendering : Text.QtRendering;
}
