import "impl"
import QtQuick 2.8
import QtQuick.Controls 2.1


Pane {
    property bool alternateColor: false


    id: control

    padding: 0 // Pane seems to apply some default padding > 0 (why?!) (padding for its inner content)
    opacity: 1.0

    background: PaneBackground {
    }
}
