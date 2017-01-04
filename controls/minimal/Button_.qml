import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import "../QC2_def" as QC2
import QtQuick 2.7
import QtQuick.Controls 2.0


QC2.Button_ {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false


    id: control

    hoverEnabled: true

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Label_ {
        id: label

        anchors.fill: control
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: control.text
    }

    background: ButtonBackground {
    }
}
