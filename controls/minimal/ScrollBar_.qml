import "../_shared/impl"
import "../_shared/impl/obtainButtonProps.js" as ButtonProp
import QtQuick 2.8
import QtQuick.Controls 2.1


ScrollBar {
    id: control


    CfgControls {
        id: cfgSingleton
    }

    hoverEnabled: true

    contentItem: Rectangle {
        implicitWidth: cfgSingleton.wScrollBarWidth
        implicitHeight: implicitWidth
        radius: cfgSingleton.rCommonControlRadius
        color: ButtonProp.obtainPressableControlColor(control, extColors.activeC.mid, extColors.activeC.midlight, extColors.activeC.shadow, extColors.disabledC.midlight)
        visible: control.size < 1.0 ? true : false
    }
}
