import QtQuick 2.8


Pane_ {
    property alias text: label.text
    property alias defaultValue: spinbox.value
    property int inputWidthInChars: 20
    property alias horizontalAlignmentOfInput: spinbox.horizontalAlignment
    property alias minimumValue: spinbox.minimumValue
    property alias maximumValue: spinbox.maximumValue
    property alias stepSize: spinbox.stepSize


    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Row {
        spacing: extSpacing.space1

        SpinBox_ {
            id: spinbox
            width: extSpacing.charLikeWidth * (3 + inputWidthInChars)
        }

        Label_ {
            id: label
            anchors.verticalCenter: spinbox.verticalCenter
        }
    }
}
