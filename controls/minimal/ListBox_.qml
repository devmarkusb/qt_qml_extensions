//! *Important* Your model needs to have a role called text.
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import "../_shared/impl/obtainListDelegateProps.js" as ListDelegateProp
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3


GroupBox_ {
    property int textHorAlignment: Text.AlignLeft
    property int textElide: Text.ElideRight
    property alias listmodel: listview.model
    property alias currentIndex: listview.currentIndex
    property bool hasDeleteItemCap: false
    signal itemDoubleClicked()
    signal itemDeleteClicked(int idx)


    id: control

    CfgControls {
        id: cfgSingleton
    }

    padding: extSpacing.pixLayoutSpacing
    topPadding: extSpacing.pix0space
    spacing: extSpacing.pix0space
    implicitWidth: cfgSingleton.wTextFieldWidth
    implicitHeight: 3 * cfgSingleton.hTextFieldHeight + topPadding + bottomPadding
    font: extFont.normal
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
    hoverEnabled: true

    ListView {
        id: listview
        anchors.fill: parent
        clip: true
        activeFocusOnTab: true
        focus: true

        ScrollIndicator.vertical: ScrollIndicator {}

        delegate: ItemDelegate {
            id: deleg
            implicitWidth: control.width - control.leftPadding - control.rightPadding
            implicitHeight: cfgSingleton.hTextFieldHeight
            contentItem: RowLayout {
                anchors.fill: parent

                Label_ {
                    id: delegLabel
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height
                    Layout.leftMargin: cfgSingleton.hTextFieldHeight / 2
                    Layout.rightMargin: leftPadding
                    horizontalAlignment: textHorAlignment
                    verticalAlignment: Text.AlignVCenter
                    elide: textElide
                    text: model.text ? model.text : modelData // I wonder if there is a way to access the textRole, chosen for the ComboBox
                }
                ButtonTool_ {
                    id: delbtn
                    visible: hasDeleteItemCap && (mousearea.containsMouse || hovered || (index === listview.currentIndex))
                    Layout.alignment: Qt.AlignRight
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: Layout.preferredHeight
                    imageSource: "../_shared/impl/delete_cross.svg"
                    onClicked: {
                        itemDeleteClicked(index)
                    }
                } // ButtonTool_
            } // RowLayout
            background: Rectangle {
                anchors.fill: parent
                radius: cfgSingleton.rCommonControlRadius
                color: (index === listview.currentIndex)
                       ? extColors.activeC.mid
                       : ListDelegateProp.obtainListDelegateColor(control.enabled, mousearea.containsMouse,
                                                                  mousearea.pressed,
                                                                  extColors.activeC.base, extColors.activeC.alternateBase,
                                                                  extColors.activeC.mid, extColors.activeC.base)
                MouseArea {
                    id: mousearea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        listview.currentIndex = index
                    }
                    onDoubleClicked: {
                        listview.currentIndex = index
                        itemDoubleClicked()
                    }
                } // MouseArea
            } // Rectangle
        } // ItemDelegate
    } // ListView
} // GroupBox_
