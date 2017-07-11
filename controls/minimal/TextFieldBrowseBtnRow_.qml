import QtQuick 2.8
import Qt.labs.platform  1.0


Item {
    property alias placeholderText: textfield.placeholderText
    property var textfieldItem: textfield
    property alias text: textfield.text
    property int inputWidthInChars: 20
    property alias folder: selectDialog.folder
    property alias nameFilters: selectDialog.nameFilters
    property alias browseTitle: selectDialog.title
    property alias file: selectDialog.file
    property alias horizontalAlignment: textfield.horizontalAlignment
    property alias validator: textfield.validator

    signal accepted()
    signal rejected()
    signal editingFinished()


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

        ButtonTool_ {
            id: browseBtn
            squareSideLength: textfield.height
            imageSource: "../_shared/impl/open.png"
            colorOverlayActive: false
            anchors.verticalCenter: textfield.verticalCenter
            onClicked: {
                selectDialog.open()
            }
        }        
    } // Row

    FileDialog {
        id: selectDialog

        onAccepted: {
            control.accepted()
        }

        onRejected: {
            control.rejected()
        }
    } // FileDialog
} // Item
