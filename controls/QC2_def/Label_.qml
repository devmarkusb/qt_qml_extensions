import "../_shared/impl/obtainControlProps.js" as ControlProp
import QtQuick 2.7
import QtQuick.Controls 2.0


Label {
    elide: Text.ElideRight
    renderType: ControlProp.obtainRenderType()
}
