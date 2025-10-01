import QtQuick
import QtQuick.Layouts


FocusScope {
    property alias placeholderText: textfield.placeholderText
    property var textfieldItem: textfield
    property alias text: textfield.text
    property alias title: label.text
    property alias inputMethodHints: textfield.inputMethodHints
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
        layoutDirection: labelPos === "right" ? Qt.RightToLeft : Qt.LeftToRight

        Label_ {
            id: label
        }

        TextField_ {
            id: textfield
            focus: true
            Layout.preferredWidth: inputWidth !== 0 ? inputWidth : extSpacing.charLikeWidth * inputWidthInChars
            onEditingFinished: {
                control.editingFinished()
            }
        }
    } // GridLayout
} // FocusScope
