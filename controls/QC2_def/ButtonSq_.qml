import "../_shared/impl"
import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7


Button_ {
    //! If you set this to true, the Button will be colored in a special way
    /** More precisely the 'highlight' color from the current color scheme is used.*/
    property bool isSpecial: false
    property alias imageSource: img.source
    property real squareSideLength: cfgSingleton.sqButtonSideLength


    id: control

    CfgControls {
        id: cfgSingleton
    }

    width: Math.max(squareSideLength, cfgSingleton.sqButtonSideLength)
    height: width

    contentItem: Image {
        id: img

        anchors.fill: control
        sourceSize.width: width
        sourceSize.height: height

        opacity: ControlProp.obtainOpacity(control.enabled)
    }
}
