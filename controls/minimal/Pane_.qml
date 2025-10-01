import "impl"
import QtQuick
import QtQuick.Controls


Pane {
    property bool alternateColor: false


    id: control

    padding: 0 // Pane seems to apply some default padding > 0 (why?!) (padding for its inner content)
    opacity: 1.0

    background: PaneBackground {
    }
}
