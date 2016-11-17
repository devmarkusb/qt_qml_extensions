/**
    This is *not* a ready-to-use control!
    
    Please see the comment in impl/GroupBoxQC1Style.qml.
    
    Use the usual GroupBox_ *without* text instead.
*/

import "impl"
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


GroupBox {
    id: control

    width: childrenRect.width
    height: childrenRect.height

    style: GroupBoxQC1Style {
    }
}
