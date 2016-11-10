import "../../layout"
import QtQuick 2.7


Item {
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
        spacing: ExtSpacing.space1

        SpinBox_def {
            id: spinbox
            width: ExtSpacing.charLikeWidth * (3 + inputWidthInChars)
        }

        Label_def {
            id: label
            anchors.verticalCenter: spinbox.verticalCenter
        }
    }
}
