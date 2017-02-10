import "../_shared/impl"
import QtQuick 2.8
import QtQuick.Controls 2.1


TabButton {
    CfgControls {
        id: cfgSingleton
    }

    //implicitWidth: contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor
}
