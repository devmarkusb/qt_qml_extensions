import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


Pane {
    property bool alternateColor: false


    id: control

    padding: 0 // Pane seems to apply some default padding > 0 (why?!) (padding for its inner content)
    opacity: 1.0

    background: Rectangle {
        color: alternateColor ? ControlProp.obtainBaseAlternateColor(control.enabled) : ControlProp.obtainBaseColor(control.enabled)
        //color: "yellow" // for testing...
    }
}
