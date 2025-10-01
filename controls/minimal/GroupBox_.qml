//! *Important* hint: if you use GroupBox_, you might want a Layout.topMargin: extSpacing.charLikeHeight
//! or such in order for the group box title not to overlap GUI parts above.
import "impl"
import QtQuick
import QtQuick.Controls


GroupBox {
    property bool alternateColor: false


    id: control

    topPadding: extSpacing.charLikeHeight / 2
    padding: extSpacing.charLikeHeight * 0.66 // factor to not waste too much space within group box
    bottomPadding: padding * 2

    label: Label_ {
        x: extSpacing.charLikeHeight
        anchors.verticalCenter: rect.top
        text: control.title
        opacity: 1.0 // fix for a disabled group box (the frame would draw over text if text get's opacity lower 1.0)
        background:  Pane_ {
            alternateColor: control.alternateColor
        }
    }

    background: FrameBackground {
        id: rect

        y: control.topPadding - control.padding
        width: parent.width
        height: parent.height - control.topPadding - control.bottomPadding + 2 * control.padding
    }
}
