import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8
import QtQuick.Controls 2.1


Label {
    id: control


    renderType: ControlProp.obtainRenderType()

    onLinkActivated: Qt.openUrlExternally(link)
    MouseArea {
        anchors.fill: parent
        cursorShape: control.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
        acceptedButtons: Qt.NoButton
    }
}
