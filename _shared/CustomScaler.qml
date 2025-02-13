import "../controls/minimal"
import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1


RowLayout {
    Label_ {
        text: "Scale factor"
        font.bold: true // this stays for testing the fix of an ugly bug where this breaks custom scaling
        Layout.alignment: Qt.AlignVCenter
    }

    Slider {
        id: scaleSlider
        from: 0.1
        to: 10.0
        value: extScale.factor
        stepSize: 0.1
        snapMode: Slider.SnapOnRelease
        ToolTip {
            parent: scaleSlider.handle
            visible: scaleSlider.pressed
            text: scaleSlider.valueAt(scaleSlider.position).toFixed(1)
        }
        onValueChanged: {
            extScale.factor = value
        }
    }

    Label_ {
        text: extScale.factor
        Layout.alignment: Qt.AlignVCenter
    }
}
