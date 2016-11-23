import "impl"
import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias imageSource: img.source
    property real squareSideLength: cfgSingleton.sqButtonSideLength


    id: control

    CfgControls {
        id: cfgSingleton
    }

    hoverEnabled: true

    width: Math.max(squareSideLength, cfgSingleton.sqButtonSideLength)
    height: width

    opacity: ControlProp.obtainOptionalDisablingOpacity(control.enabled)

    contentItem: Image {
        id: img

        anchors.fill: control
        sourceSize.width: width
        sourceSize.height: height

        opacity: ControlProp.obtainDisablingOpacity(control.enabled)
    }

    background: ButtonBackground {
    }
}
