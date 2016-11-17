import QtQuick 2.7
import QtQuick.Controls 2.0


Label {
    elide: Text.ElideRight
    renderType: extOS.os === "WINDOWS" ? Text.NativeRendering : Text.QtRendering
}
