import QtQuick 2.8
import QtQuick.Controls 2.1


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
    timeout: extControlsCfg.tooltipTimeout_ms

    contentItem: Label_ {
        text: control.text
    }
}
