import "../_shared/impl/obtainControlProps.js" as ControlProp
import "impl"
import QtQuick
import QtQuick.Controls


Drawer {
    id: control

    font: extFont.normal

    opacity: 1.0

    background: PaneBackground {
        controlEnabled: true
        color: ControlProp.obtainWindowColor(control.enabled)
    }
}
