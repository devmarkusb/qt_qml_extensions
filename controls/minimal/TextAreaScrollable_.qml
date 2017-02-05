import QtQuick 2.7
import QtQuick.Controls 2.0


Flickable {
    property alias readOnly: textarea.readOnly
    property alias selectByMouse: textarea.selectByMouse
    property alias text: textarea.text
    property alias textFormat: textarea.textFormat
    property alias wrapMode: textarea.wrapMode
    property alias font: textarea.font


    clip: true
    ScrollBar.horizontal: ScrollBar_ {}
    ScrollBar.vertical: ScrollBar_ {}

    TextArea.flickable: TextArea_ {
        id: textarea
        anchors.fill: parent        
    }
}
