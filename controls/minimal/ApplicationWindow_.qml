//! Please note that by default the ApplicationWindow_ is not visible.
import "impl"
import QtQuick 2.8
import QtQuick.Controls 2.2


ApplicationWindow {
    property bool alternateColor: false


    id: control

    font: extFont.normal

    background: PaneBackground {
        controlEnabled: true
    }
}
