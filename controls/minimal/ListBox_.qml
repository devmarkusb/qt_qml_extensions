//! *Important* Your model needs to have a role called text.
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import "../_shared/impl/obtainListDelegateProps.js" as ListDelegateProp
import QtQuick 2.7
import QtQuick.Controls 2.0


GroupBox_ {
    property int textHorAlignment: Text.AlignLeft
    property alias listmodel: listview.model
    property alias currentIndex: listview.currentIndex


    id: control

    CfgControls {
        id: cfgSingleton
    }

    padding: extSpacing.pix1space
    topPadding: 0
    spacing: 0
    implicitWidth: cfgSingleton.wTextFieldWidth
    implicitHeight: 3 * cfgSingleton.hTextFieldHeight + topPadding + bottomPadding
    font: extFont.normal
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
    hoverEnabled: true

    ListView {
        id: listview
        anchors.fill: parent
        clip: true

        ScrollIndicator.vertical: ScrollIndicator {}

        delegate: ItemDelegate {
            id: deleg
            implicitWidth: control.width - control.leftPadding - control.rightPadding
            implicitHeight: cfgSingleton.hTextFieldHeight
            contentItem: Label_ {
                anchors.fill: parent
                leftPadding: cfgSingleton.hTextFieldHeight / 2
                rightPadding: leftPadding
                horizontalAlignment: textHorAlignment
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                text: model.text ? model.text : modelData // I wonder if there is a way to access the textRole, chosen for the ComboBox
            }
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
                } // MouseArea
            } // Rectangle
        } // ItemDelegate
    } // ListView
} // GroupBox_
