import "../QC2_def" as QC2
import QtQuick 2.8


//! Expects the parent item to have a 'hovered' bool property.
QC2.ToolTip_ {
    id: control


    contentItem: Label_ {
        text: control.text
        color: "black" // we don't change the background color, so let's assume ToolTips will always be the same style
    }
}
