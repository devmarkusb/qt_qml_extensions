import "impl"
import "../QC2_def"
import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


ComboBox_ {
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
        width: control.width
        height: control.height
        contentItem: Label_ {
            text: modelData
            horizontalAlignment: textHorAlignment
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex == index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: cfgSingleton.wComboBoxIndicatorWidth
        height: cfgSingleton.hComboBoxIndicatorHeight
        contextType: "2d"

        Connections {
            target: control
            onPressedChanged: canvas.requestPaint()
        }

        onPaint: {
            context.reset();
            context.moveTo(0, height / 2 + 2);
            context.lineTo(width, height / 2 + 2);
            context.lineTo(width / 2, height - 2);
            context.closePath();
            context.fillStyle = extColors.activeC.text;
            context.fill();

            context.moveTo(0, height / 2 - 2);
            context.lineTo(width, height / 2 - 2);
            context.lineTo(width / 2, 2);
            context.closePath();
            context.fillStyle = extColors.activeC.text;
            context.fill();
        }
    }

    contentItem: Label_ {
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
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
        y: control.height + 1
        width: control.width
        implicitHeight: listview.contentHeight
        padding: cfgSingleton.rCommonControlRadius / 2

        contentItem: ListView {
            id: listview
            clip: true
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {            
            radius: cfgSingleton.rCommonControlRadius
            border.width: extSpacing.wBorderWidth
            border.color: control.enabled ? extColors.activeC.shadow : extColors.disabledC.shadow
            color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
        }
    }
}
