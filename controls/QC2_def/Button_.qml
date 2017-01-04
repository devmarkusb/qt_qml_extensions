import "../_shared/impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    property bool isSpecial: false


    CfgControls {
        id: cfgSingleton
    }

    implicitWidth: Math.max(cfgSingleton.wButtonWidth, contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor)
}
