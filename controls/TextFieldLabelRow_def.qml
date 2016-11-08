import "../layout"
import QtQuick 2.7
import QtQuick.Controls 1.4


Item {
    property alias placeholderText: textfield.placeholderText
    property alias text: label.text
    property int inputWidthInChars: 20


    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Row {
        spacing: ExtSpacing.space1
        TextField {
            id: textfield
            width: ExtSpacing.charLikeWidth * inputWidthInChars
        }
        Label {
            id: label
            anchors.verticalCenter: textfield.verticalCenter
        }
    }
}
