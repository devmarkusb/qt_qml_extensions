import "../QC2_def" as QC2
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8


QC2.Label_ {
    property bool isSpecial: false
    property real fontPointSizeFactor: 1.0


    id: control

    //font: extFont.normal // either that or you need to specify all :/ no way to override single sub props
    font.capitalization: extFont.normal.capitalization
    font.family: extFont.normal.family
    font.hintingPreference: extFont.normal.hintingPreference
    font.letterSpacing: extFont.normal.letterSpacing
    // strange enough, if I don't specify the font size here, the font won't custom scale anymore if I set e.g. italic (!?)
    font.pointSize: extFont.normal.pointSize * fontPointSizeFactor
    font.strikeout: extFont.normal.strikeout
    font.underline: extFont.normal.underline
    font.weight: extFont.normal.weight
    font.wordSpacing: extFont.normal.wordSpacing

    color: {
        if (isSpecial)
            enabled ? extColors.activeC.highlightedText : extColors.inactiveC.highlightedText
        else
            enabled ? extColors.activeC.text : extColors.disabledC.text
    }
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
}
