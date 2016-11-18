import "../_shared/impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


TabBar {
    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: 1.0

    background: Rectangle {
        color: extColors.activeC.window
    }
}
