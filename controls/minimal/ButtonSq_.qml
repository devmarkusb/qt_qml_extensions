import "../../layout"
import QtQuick 2.7


Button_ {
    Text_ {
        id: textSingleton
    }

    FontMetrics {
        id: fontMetrics_def
        font: textSingleton.font
    }

    implicitWidth: Math.max(ExtSpacing.pixMediumIconSq, 3 * fontMetrics_def.height)
    implicitHeight: width
}
