// You might want to set something like
//      text: qmlextlib.dynTr + nativeText
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8


Label_ {
    property var basecontrol
    property alias sequence: controlSC.sequence
    property alias nativeText: controlSC.nativeText
    signal activated()


    id: control
    anchors.right: basecontrol.right
    anchors.rightMargin: extSpacing.charLikeWidth
    height: basecontrol.height
    verticalAlignment: Text.AlignVCenter
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled) / 2
    Shortcut {
        id: controlSC
        context: Qt.ApplicationShortcut
        autoRepeat: false
        onActivated: control.activated()
    }
}
