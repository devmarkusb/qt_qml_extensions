/**
    This is *not* a ready-to-use style!
    
    It is a working draft to construct a self-made GroupBox that is capable
    of styling especially the text part. Neither QC1 nor QC2 GroupBoxes are
    satisfactory in that regard.
    
    Alternatives:
        Just use the provided usual GroupBox_ *without* text, and put the text
        within  or outside the GroupBox_ (e.g. by ColumnLayout).
    
    Implementation noted:
        * So far I didn't succeed making the childrenRect larger by default.
        * Coloring the text background with the proper background color would
            be the next interesting todo.
*/

import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0


Style {
    property Component panel: Rectangle {
        anchors.fill: parent
        anchors.margins: 0
        border.width: 1
        border.color: "black"

        Label_ {
            id: titleText
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.top
            anchors.bottomMargin: -titleText.contentHeight / 2.0
            text: control.title
            background: Rectangle {
                color: "yellow"
                anchors.fill: titleText
            }
        }
    }
}
