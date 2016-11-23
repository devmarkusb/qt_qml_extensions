import QtQuick 2.7


Item {
    property alias placeholderText: textfield.placeholderText
    property alias text: label.text
    property int inputWidthInChars: 20
    property alias horizontalAlignment: textfield.horizontalAlignment


    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Row {
        spacing: extSpacing.space1

        TextField_ {
            id: textfield
            width: extSpacing.charLikeWidth * inputWidthInChars
        }

        Label_ {
            id: label
            anchors.verticalCenter: textfield.verticalCenter
        }
    }
}
