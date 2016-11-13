import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Button {
    Text_ {
        id: textSingleton
    }

    FontMetrics {
        id: fontMetricsSingleton
        font: textSingleton.font
    }

    implicitHeight: 2.4 * fontMetricsSingleton.height
    implicitWidth: 25 * fontMetricsSingleton.averageCharacterWidth
}
