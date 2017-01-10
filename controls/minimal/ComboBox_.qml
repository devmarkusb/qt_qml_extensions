//! *Important* Your model needs to have a role called text.
//! (Which you then also should have chosen as textRole for the Combobox.)
import "../QC2_def" as QC2
import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import "../_shared/impl/obtainControlProps.js" as ControlProp
import "../_shared/impl/obtainListDelegateProps.js" as ListDelegateProp
import QtQuick 2.7
import QtQuick.Controls 2.0


QC2.ComboBox_ {
    property int textHorAlignment: Text.AlignLeft


    id: control

    CfgControls {
        id: cfgSingleton
    }

    padding: 0
    spacing: 0
    implicitWidth: cfgSingleton.wTextFieldWidth
    implicitHeight: cfgSingleton.hTextFieldHeight
    font: extFont.normal
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)
    hoverEnabled: true

    delegate: ItemDelegate {
        id: deleg
        width: control.width - cbpopup.leftPadding - cbpopup.rightPadding
        height: control.height
        contentItem: Label_ {
            text: model.text ? model.text : modelData // I wonder if there is a way to access the textRole, chosen for the ComboBox
            elide: Text.ElideRight
            horizontalAlignment: textHorAlignment
            verticalAlignment: Text.AlignVCenter
        }
        background:Rectangle {
            anchors.fill: parent
            radius: cfgSingleton.rCommonControlRadius
            color: (index === control.currentIndex)
                   ? extColors.activeC.mid
                   : ListDelegateProp.obtainListDelegateColor(control.enabled, mousearea.containsMouse,
                                                              mousearea.pressed,
                                                              extColors.activeC.base, extColors.activeC.midlight,
                                                              extColors.activeC.mid, extColors.activeC.base)
            MouseArea {
                id: mousearea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    control.currentIndex = index
                    control.popup.close()
                }
            } // MouseArea
        } // Rectangle
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: cfgSingleton.wComboBoxIndicatorWidth
        height: cfgSingleton.hComboBoxIndicatorHeight
        // Impl. note.
        // The Qt doc example uses a once-declaration of `contextType: "2d"`.
        // But that does only work for the first appearance of the control, it seems.

        Connections {
            target: control
            onPressedChanged: canvas.requestPaint()
        }

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.moveTo(0, height / 2 + 2);
            ctx.lineTo(width, height / 2 + 2);
            ctx.lineTo(width / 2, height - 2);
            ctx.closePath();
            ctx.fillStyle = extColors.activeC.text;
            ctx.fill();

            ctx.moveTo(0, height / 2 - 2);
            ctx.lineTo(width, height / 2 - 2);
            ctx.lineTo(width / 2, 2);
            ctx.closePath();
            ctx.fillStyle = extColors.activeC.text;
            ctx.fill();
        }
    }

    contentItem: Label_ {
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        elide: Text.ElideRight
        horizontalAlignment: textHorAlignment
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: cfgSingleton.rCommonControlRadius
        border.width: extSpacing.wBorderWidth
        border.color: ButtonProp.obtainButtonBorderColor(control, extColors.activeC.shadow, extColors.activeC.highlight, extColors.activeC.shadow, extColors.disabledC.shadow)
        color: ButtonProp.obtainPressableControlColor(control, extColors.activeC.base, extColors.activeC.button, extColors.activeC.midlight, extColors.disabledC.midlight)
    }

    popup: Popup {
        id: cbpopup
        y: control.height + extSpacing.pix1space
        implicitWidth: control.width
        implicitHeight: listview.contentHeight + topPadding + bottomPadding
        padding: extSpacing.pix1space

        contentItem: ListView {
            id: listview
            clip: true
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            highlightFollowsCurrentItem: false

            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            radius: cfgSingleton.rCommonControlRadius
            implicitWidth: cbpopup.implicitWidth
            border.width: extSpacing.wBorderWidth
            border.color: control.enabled ? extColors.activeC.shadow : extColors.disabledC.shadow
            color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
        }
    }
}
