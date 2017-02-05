import "../_shared/impl/obtainControlProps.js" as ControlProp
// On update to > 2.7 please check necessity of 'Hack' below.
import QtQuick 2.7
import QtQuick.Controls 2.0


Label {
    renderType: ControlProp.obtainRenderType()

    onTextChanged: {
        // Hack. Yet fearlessly implemented at low-level position.
        // Reason: When updating Button texts due to dynamic language change and translation centered texts
        // where not re-centered correctly according to their and the button's new length.
        if (horizontalAlignment !== Text.AlignLeft) {
            var bak = horizontalAlignment
            horizontalAlignment = Text.AlignLeft
            horizontalAlignment = bak
        }
    }

    onLinkActivated: Qt.openUrlExternally(link)
    MouseArea {
        anchors.fill: parent
        cursorShape: control.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        acceptedButtons: Qt.NoButton
    }
}
