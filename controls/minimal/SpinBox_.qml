import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


SpinBox {
    property int horizontalTextAlignment: Qt.AlignHCenter


    id: control

    CfgControls {
        id: cfgSingleton
    }

    editable: true

    height: cfgSingleton.hSpinIndicatorHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: TextInput_ {
        z: 2
        text: control.textFromValue(control.value, control.locale)
        horizontalAlignment: horizontalTextAlignment
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
    }

    up.indicator: Button_ {
        x: control.mirrored ? 0 : parent.width - width
        implicitWidth: cfgSingleton.wSpinIndicatorWidth
        implicitHeight: cfgSingleton.hSpinIndicatorHeight
        text: "+"
        focusPolicy: Qt.NoFocus // focus doesn't really work here anyway (better never than half-baked)
    }

    down.indicator: Button_ {
        x: control.mirrored ? parent.width - width : 0
        implicitWidth: cfgSingleton.wSpinIndicatorWidth
        implicitHeight: cfgSingleton.hSpinIndicatorHeight
        text: "-"
        focusPolicy: Qt.NoFocus // see comment in up.indicator
    }

    background: Rectangle {
        color: control.enabled ? extColors.activeC.base : extColors.disabledC.base
        border.color: control.enabled ? (control.activeFocus ? extColors.activeC.highlight : extColors.activeC.shadow) : extColors.disabledC.shadow
        border.width: control.activeFocus ? extSpacing.wBorderWidthSize2 : extSpacing.wBorderWidth
    }
}
