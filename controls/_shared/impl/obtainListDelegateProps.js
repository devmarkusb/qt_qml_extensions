//####################################################################################################################
// color

function obtainListDelegateColor(isEnabled, isHovered, isDown, normal, hovered, down, disabled) {
    if (isEnabled) {
        if (isDown)
            return down;
        else {
            if (isHovered)
                return hovered;
            else
                return normal;
        }
    }
    else {
        if (isDown)
            return down;
        else
            return disabled;
    }
}
