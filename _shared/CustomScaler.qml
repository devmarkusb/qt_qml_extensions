import "../core/os.js" as OS
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


RowLayout {
    id: root

    readonly property real minFactor: 0.1
    readonly property real maxFactor: 10.0

    function nonScalingLayoutDp(pixels_for_96ppi) {
        if (!OS.is_mobile())
            return extScale.dp2p_nonscaling(pixels_for_96ppi)
        // dp2p_nonscaling is physical-density based; Android/iOS layout uses device-independent pixels.
        return pixels_for_96ppi * extScale.ppi_phys / extScale.refScreen_ppi / Screen.devicePixelRatio
    }

    readonly property real uiFontSize: nonScalingLayoutDp(11)
    readonly property real sliderPreferredWidth: OS.is_mobile()
        ? Math.min(nonScalingLayoutDp(240), Screen.width * 0.55)
        : nonScalingLayoutDp(240)
    readonly property real sliderPreferredHeight: nonScalingLayoutDp(28)

    Label {
        text: "Scale factor"
        font.bold: true // this stays for testing the fix of an ugly bug where this breaks custom scaling
        font.pixelSize: root.uiFontSize
        Layout.alignment: Qt.AlignVCenter
    }

    Slider {
        id: scaleSlider

        property bool syncingValue: false

        function factorToPosition(factor) {
            var logMin = Math.log10(root.minFactor)
            var logMax = Math.log10(root.maxFactor)
            return (Math.log10(factor) - logMin) / (logMax - logMin)
        }

        function positionToFactor(position) {
            var logMin = Math.log10(root.minFactor)
            var logMax = Math.log10(root.maxFactor)
            return Math.pow(10, logMin + position * (logMax - logMin))
        }

        function snapFactor(factor) {
            return Math.max(root.minFactor, Math.min(root.maxFactor, Math.round(factor * 10) / 10))
        }

        from: 0
        to: 1
        stepSize: 0.002
        snapMode: Slider.SnapOnRelease
        font.pixelSize: root.uiFontSize
        height: root.sliderPreferredHeight
        Layout.preferredWidth: root.sliderPreferredWidth
        Layout.preferredHeight: root.sliderPreferredHeight
        Layout.alignment: Qt.AlignVCenter

        Component.onCompleted: value = factorToPosition(extScale.factor)

        onPressedChanged: {
            if (!pressed) {
                var snapped = snapFactor(extScale.factor)
                syncingValue = true
                extScale.factor = snapped
                value = factorToPosition(snapped)
                syncingValue = false
            }
        }

        onValueChanged: {
            if (syncingValue)
                return
            extScale.factor = positionToFactor(value)
        }

        ToolTip {
            parent: scaleSlider.handle
            visible: scaleSlider.pressed
            text: scaleSlider.positionToFactor(scaleSlider.position).toFixed(1)
        }

        Connections {
            target: extScale
            function onFactorChanged() {
                if (scaleSlider.pressed)
                    return
                scaleSlider.syncingValue = true
                scaleSlider.value = scaleSlider.factorToPosition(extScale.factor)
                scaleSlider.syncingValue = false
            }
        }
    }

    Label {
        text: extScale.factor.toFixed(1)
        font.pixelSize: root.uiFontSize
        Layout.alignment: Qt.AlignVCenter
    }
}
