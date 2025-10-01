import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick
import QtQuick.Controls


Label {
    property bool isSpecial: false
    property real fontSizeFactor: 1.0
    property font fontToUse: extFont.normal


    id: control

    renderType: ControlProp.obtainRenderType()

    // { copied code start (Label_, TextField_, TextInput_, TextArea_)
//    font: fontToUse // either that or you need to specify all :/ no way to override single sub props
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

    color: {
        if (isSpecial)
            enabled ? extColors.activeC.highlightedText : extColors.inactiveC.highlightedText
        else
            enabled ? extColors.activeC.text : extColors.disabledC.text
    }
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    onLinkActivated: Qt.openUrlExternally(link)
    MouseArea {
        anchors.fill: parent
        cursorShape: control.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        acceptedButtons: Qt.NoButton
    }
}
