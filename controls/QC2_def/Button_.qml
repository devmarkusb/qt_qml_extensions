import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    Text_ {
        id: textSingleton
    }

    FontMetrics {
        id: fontMetricsSingleton
        font: textSingleton.font
    }

    implicitHeight: 2.5 * fontMetricsSingleton.height
    implicitWidth: 25 * fontMetricsSingleton.averageCharacterWidth
}
