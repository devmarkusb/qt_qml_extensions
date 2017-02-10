import "../_shared/impl"
import QtQuick 2.8


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

    width: squareSideLength
    height: width

    contentItem: Image {
        id: img

        anchors.fill: control
        sourceSize.width: width
        sourceSize.height: height
    }
}
