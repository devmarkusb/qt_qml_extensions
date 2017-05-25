import QtQuick 2.8


Rectangle {
    id: root
    property alias a: root.width


    color: "darkblue"
    width: 10 * extSpacing.scaleFactor
    height: width
}
