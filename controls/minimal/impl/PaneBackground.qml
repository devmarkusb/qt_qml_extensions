import "../../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick


Rectangle {
    property bool controlEnabled: control.enabled

    color: alternateColor ? ControlProp.obtainBaseAlternateColor(controlEnabled) : ControlProp.obtainBaseColor(controlEnabled)
    //color: "yellow" // for testing...
}
