import QtQuick 2.8


Item {
    property alias placeholderText: textfield.placeholderText
    property var textfieldItem: textfield
    property alias text: textfield.text
    property alias readOnly: textfield.readOnly
    property int inputWidthInChars: 20
    property alias horizontalAlignment: textfield.horizontalAlignment
    property alias validator: textfield.validator

    signal editingFinished()
    signal clicked()


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
                control.clicked()
            }
        }        
    } // Row
} // Item
