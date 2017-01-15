import "../QC2_def" as QC2
import QtQuick 2.7


//! Expects the parent item to have a 'hovered' bool property.
QC2.ToolTip_ {
    id: control


    contentItem: Label_ {
        text: control.text
    }
}
