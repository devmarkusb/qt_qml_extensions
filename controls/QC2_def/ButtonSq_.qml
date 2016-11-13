import "../../layout"
import QtQuick 2.7


Button_ {
    Text_ {
        id: textSingleton
    }

    FontMetrics {
        id: fontMetricsSingleton
        font: textSingleton.font
    }

    implicitWidth: Math.max(ExtSpacing.pixlargeIconSq, 3 * fontMetricsSingleton.height)
    implicitHeight: width
}
