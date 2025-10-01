import QtQuick
import QtQuick.Controls


Flickable {
    property alias readOnly: textarea.readOnly
    property alias selectByMouse: textarea.selectByMouse
    property alias text: textarea.text
    property alias textFormat: textarea.textFormat
    property alias wrapMode: textarea.wrapMode
    property alias font: textarea.font


    id: control

    clip: true
    ScrollBar.horizontal: ScrollBar_ {}
    ScrollBar.vertical: ScrollBar_ {}

    TextArea.flickable: TextArea_ {
        id: textarea
    }

    Keys.onPressed: {
        if (!readOnly)
            return
        if (event.key === Qt.Key_Down) {
            control.flick(0, -extControlsCfg.flickDefaultVelocity);
        }
        else if (event.key === Qt.Key_Up) {
            control.flick(0, extControlsCfg.flickDefaultVelocity);
        }
        else if (event.key === Qt.Key_PageDown) {
            control.flick(0, -extControlsCfg.flickFastVelocity);
        }
        else if (event.key === Qt.Key_PageUp) {
            control.flick(0, extControlsCfg.flickFastVelocity);
        }
    }
} // Flickable
