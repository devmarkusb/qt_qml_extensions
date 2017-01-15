import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


Label_ {
    property var basecontrol
    property alias sequence: controlSC.sequence
    signal activated()


    id: control
    anchors.right: basecontrol.right
    anchors.rightMargin: extSpacing.charLikeWidth
    height: basecontrol.height
    verticalAlignment: Text.AlignVCenter
    text: controlSC.nativeText
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled) / 2
    Shortcut {
        id: controlSC
        context: Qt.ApplicationShortcut
        autoRepeat: false
        onActivated: control.activated()
    }
}
