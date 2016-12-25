import QtQuick 2.7
import QtQuick.Dialogs 1.2


Item {
    property alias placeholderText: textfield.placeholderText
    property var textfieldItem: textfield
    property alias text: textfield.text
    property int inputWidthInChars: 20
    property alias folder: selectDialog.folder
    property alias browseTitle: selectDialog.title
    property alias fileUrl: selectDialog.fileUrl
    property alias horizontalAlignment: textfield.horizontalAlignment
    property alias validator: textfield.validator
    property bool isGUIonly: false

    signal accepted()
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
            anchors.verticalCenter: textfield.verticalCenter
            onClicked: {
                selectDialog.open()
            }
        }        
    }

    FileDialog {
        id: selectDialog

        onVisibleChanged: {
            if (!control.isGUIonly && visible && control.text.length === 0)
                folder = shortcuts.home
        }

        Component.onCompleted: {
            if (control.isGUIonly)
                folder = shortcuts.home
        }

        nameFilters: cfgProgMainModel.mainLoadFilters

        onAccepted: {
            control.accepted()
        }

        onRejected: {
        }
    }
}
