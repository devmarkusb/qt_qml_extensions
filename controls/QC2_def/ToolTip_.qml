import QtQuick 2.7
import QtQuick.Controls 2.0


//! Expects the parent item to have a 'hovered' bool property.
ToolTip {
    id: control


    delay: Qt.styleHints.mousePressAndHoldInterval
    visible: extControlsCfg.tooltipsEnabled ? parent.hovered : false

    contentItem: Label_ {
        text: control.text
    }
}
