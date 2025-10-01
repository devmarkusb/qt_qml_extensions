//! Please note that by default the ApplicationWindow_ is not visible.
import "impl"
import QtQuick
import QtQuick.Controls


ApplicationWindow {
    property bool alternateColor: false


    id: control

    font: extFont.normal

    background: PaneBackground {
        controlEnabled: true
    }
}
