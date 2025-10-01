import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.8
import QtQuick.Controls 2.2


SpinBox {
    id: control

    property int horizontalTextAlignment: Qt.AlignHCenter

    height: cfgSingleton.hSpinIndicatorHeight
    implicitWidth: textField.implicitWidth + upIndicator.implicitWidth + downIndicator.implicitWidth

    editable: true
    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    CfgControls {
        id: cfgSingleton
    }

    contentItem: TextInput_ {
        id: textField
        z: 2
        text: control.textFromValue(control.value, control.locale)
        inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPredictiveText
        horizontalAlignment: horizontalTextAlignment
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: downIndicator.right
        anchors.right: upIndicator.left
    }

    up.indicator: Button_ {
        id: upIndicator
        implicitWidth: cfgSingleton.wSpinIndicatorWidth
        implicitHeight: cfgSingleton.hSpinIndicatorHeight
        text: "+"
        focusPolicy: Qt.NoFocus // focus doesn't really work here anyway (better never than half-baked)
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        onClicked: increase()
    }

    down.indicator: Button_ {
        id: downIndicator
        implicitWidth: cfgSingleton.wSpinIndicatorWidth
        implicitHeight: cfgSingleton.hSpinIndicatorHeight
        text: "-"
        focusPolicy: Qt.NoFocus // focus doesn't really work here anyway (better never than half-baked)
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked: decrease()
    }

    background: TextFieldBackground {
        anchors.fill: parent
    }
}