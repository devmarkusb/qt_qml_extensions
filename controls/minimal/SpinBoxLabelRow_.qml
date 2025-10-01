import QtQuick
import QtQuick.Controls


Item {
    property alias text: label.text
    property alias value: spinbox.value
    //! !Deprecated! Was/is used for QC1 based component.
    property int inputWidthInChars: 20
    property alias horizontalAlignmentOfInput: spinbox.horizontalTextAlignment
    property alias minimumValue: spinbox.from
    property alias maximumValue: spinbox.to
    property alias stepSize: spinbox.stepSize

    implicitHeight: childrenRect.height
    implicitWidth: childrenRect.width

    Row {
        id: row
        spacing: extSpacing.space1

        SpinBox_ {
            id: spinbox
        }

        Label_ {
            id: label
            anchors.verticalCenter: spinbox.verticalCenter
        }
    }
}
