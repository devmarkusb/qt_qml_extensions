//####################################################################################################################
// color

function obtainButtonColor_impl(control, normal, hovered, checked, disabled, hoverColorForActiveFocus) {
    if (control.enabled) {
        if (control.down || control.checked)
            return checked;
        else {
            if (hoverColorForActiveFocus ? (control.hovered || control.activeFocus) : control.hovered)
                return hovered;
            else
                return normal;
        }
    }
    else {
        if (control.down || control.checked)
            return checked;
        else
            return disabled;
    }
}

function obtainButtonColor(control, normal, hovered, checked, disabled) {
    return obtainButtonColor_impl(control, normal, hovered, checked, disabled, false);
}

function obtainButtonBorderColor(control, normal, hovered, checked, disabled) {
    return obtainButtonColor_impl(control, normal, hovered, checked, disabled, true);
}


//####################################################################################################################
// border

function obtainButtonBorderWidth(control) {
    if (control.activeFocus && !control.hovered && !control.pressed && !control.checked)
        return extSpacing.wBorderWidthSize2;
    else
        return extSpacing.wBorderWidth;
}
