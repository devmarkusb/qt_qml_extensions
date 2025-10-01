import "minimal"
import QtQuick


Item {
    property real markerWidth: extSpacing.space3


    anchors.fill: parent

    Rectangle {
        color: "gray"
        anchors.left: parent.left
        anchors.top: parent.top
        width: markerWidth
        height: width
    }
    Rectangle {
        color: "gray"
        anchors.right: parent.right
        anchors.top: parent.top
        width: markerWidth
        height: width
    }
    Rectangle {
        color: "gray"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: markerWidth
        height: width
    }
    Rectangle {
        color: "gray"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: markerWidth
        height: width
    }
    Label_ {
        text: "squares are just marking the content corners"
        anchors.centerIn: parent
    }
}
