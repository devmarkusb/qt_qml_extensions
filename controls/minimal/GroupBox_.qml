import "impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


GroupBox {
    property bool alternateColor: false


    id: control

    padding: extSpacing.space3
    topPadding: extSpacing.charLikeHeight / 2

    label: Label_ {
        x: extSpacing.space2
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
        height: parent.height - control.topPadding + control.padding
    }
}
