import QtQuick 2.7
import QtQuick.Controls 2.0


//! Expects the parent item to have a 'hovered' bool property.
ToolTip {
    id: control

    //! Dirty workaround for a Qt bug: delay time didn't have any effect within
    //! started exe (Windows); qmlscene works.
    property bool show: extControlsCfg.tooltipsEnabled ? parent.hovered : false
    onShowChanged: {
        if (show)
            control.open()
        else
            control.close()
    }

    delay: Qt.styleHints.mousePressAndHoldInterval

    contentItem: Label_ {
        text: control.text
    }
}
