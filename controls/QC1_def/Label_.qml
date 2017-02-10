import QtQuick 2.8
import QtQuick.Controls 1.5


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
