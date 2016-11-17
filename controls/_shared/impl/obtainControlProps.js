//####################################################################################################################
// opacity

function obtainOpacity(enabled) {
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
