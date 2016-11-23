import "impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


ApplicationWindow {
    property bool alternateColor: false


    id: control

    font: extFont.normal

    background: PaneBackground {
        controlEnabled: true
    }
}
