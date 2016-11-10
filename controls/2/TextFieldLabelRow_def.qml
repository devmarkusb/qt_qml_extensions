import "../../layout"
import QtQuick 2.7


Item {
    property alias placeholderText: textfield.placeholderText
    property alias text: label.text
    property int inputWidthInChars: 20


    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Row {
        spacing: ExtSpacing.space1

        TextField_def {
            id: textfield
            width: ExtSpacing.charLikeWidth * inputWidthInChars
        }

        Label_def {
            id: label
            anchors.verticalCenter: textfield.verticalCenter
        }
    }
}
