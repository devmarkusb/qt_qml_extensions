import QtQuick 2.8
import QtQuick.Controls 2.2


TestRectangle {
    property alias text: label.text

    Label {
        id: label
    }
}
