import "impl"
import QtQuick 2.8
import QtQuick.Controls 2.1


ApplicationWindow {
    property bool alternateColor: false


    id: control

    font: extFont.normal

    background: PaneBackground {
        controlEnabled: true
    }
}
