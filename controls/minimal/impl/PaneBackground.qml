import "../../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


Rectangle {
    color: alternateColor ? ControlProp.obtainBaseAlternateColor(control.enabled) : ControlProp.obtainBaseColor(control.enabled)
    //color: "yellow" // for testing...
}
