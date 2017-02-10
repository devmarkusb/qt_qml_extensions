import "../_shared/impl"
import QtQuick 2.8
import QtQuick.Controls 2.1


Button {
    property bool isSpecial: false


    CfgControls {
        id: cfgSingleton
    }

    implicitWidth: Math.max(cfgSingleton.wButtonWidth, contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor)
}
