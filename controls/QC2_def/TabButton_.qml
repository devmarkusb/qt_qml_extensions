import "../_shared/impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


TabButton {
    CfgControls {
        id: cfgSingleton
    }

    //implicitWidth: contentItem.implicitWidth * cfgSingleton.wButtonImplicitWidthFactor
}
