import QtQuick 2.7


Item {
    property alias placeholderText: textfield.placeholderText
    property alias text: textfield.text
    property alias title: label.text
    property int inputWidthInChars: 20
    property alias horizontalAlignment: textfield.horizontalAlignment
    property alias validator: textfield.validator

    signal editingFinished();


    id: control
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Row {
        spacing: extSpacing.space1

        TextField_ {
            id: textfield
            width: extSpacing.charLikeWidth * inputWidthInChars
            onEditingFinished: {
                control.editingFinished()
            }
        }

        Label_ {
            id: label
            anchors.verticalCenter: textfield.verticalCenter
        }
    }
}
