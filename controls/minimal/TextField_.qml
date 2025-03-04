import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8
import QtQuick.Controls 2.2


TextField {
    property real fontSizeFactor: 1.0
    property font fontToUse: extFont.normal


    id: control

    CfgControls {
        id: cfgSingleton
    }

    // { copied code start (Label_, TextField_, TextInput_, TextArea_)
//    font: fontToUse
    font.bold: fontToUse.bold
    font.capitalization: fontToUse.capitalization
    font.family: fontToUse.family
    font.hintingPreference: fontToUse.hintingPreference
    font.italic: fontToUse.italic
    font.letterSpacing: fontToUse.letterSpacing
    // strange enough, if I don't specify the font size here, the font won't custom scale anymore if I set e.g. italic (!?)
    font.pixelSize: extFont.convert2properPixelSize(fontToUse.pointSize * fontSizeFactor)
    font.strikeout: fontToUse.strikeout
    font.underline: fontToUse.underline
    font.wordSpacing: fontToUse.wordSpacing
    // } copied code end

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
