import "impl"
import "../_shared/impl"
import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false


    id: control

    hoverEnabled: true

    contentItem: Label_ {
        id: label

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: control.text
    }

    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight
    implicitWidth: Math.max(label.implicitWidth, cfgSingleton.wButtonWidth)

    background: ButtonBackground {
    }
}
