import "../_shared/impl/obtainControlProps.js" as ControlProp
import "impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


Popup {
    id: control

    font: extFont.normal

    padding: 1 // Pane seems to apply some default padding > 0 (why?!) (padding for its inner content)
    opacity: 1.0

    background: PaneBackground {
        controlEnabled: true
        color: ControlProp.obtainWindowColor(control.enabled)
        border.color: extColors.activeC.dark
        border.width: extSpacing.wBorderWidth
    }
}
