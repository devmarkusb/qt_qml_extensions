import "impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


Drawer {
    property bool alternateColor: false


    id: control

    font: extFont.normal

    opacity: 1.0

    background: PaneBackground {
        controlEnabled: true
    }
}
