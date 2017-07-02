import QtQuick 2.8
import QtQuick.Layouts 1.3


Item {
    property alias placeholderText: textfield.placeholderText
    property var textfieldItem: textfield
    property alias text: textfield.text
    property alias title: label.text
    property int inputWidthInChars: 20
    property int inputWidth: 0
    property alias horizontalAlignment: textfield.horizontalAlignment
    property alias validator: textfield.validator
    property string labelPos: "right" //! options: "left", "right", "top"

    signal editingFinished()


    id: control
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    GridLayout {
        flow: labelPos === "top" ? GridLayout.TopToBottom : GridLayout.LeftToRight
        layoutDirection: labelPos === "left" ? Qt.LeftToRight : Qt.RightToLeft

        Label_ {
            id: label
        }

        TextField_ {
            id: textfield
            Layout.preferredWidth: inputWidth !== 0 ? inputWidth : extSpacing.charLikeWidth * inputWidthInChars
            onEditingFinished: {
                control.editingFinished()
            }
        }
    } // Row
} // Item
