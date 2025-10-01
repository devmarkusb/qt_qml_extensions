import QtQuick
import QtQuick.Controls


TestRectangle {
    property alias text: label.text

    Label {
        id: label
    }
}
