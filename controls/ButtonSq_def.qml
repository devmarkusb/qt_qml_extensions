import "../layout"
import QtQuick 2.7


Button_def {
    Text_def {
        id: text_def
    }

    FontMetrics {
        id: fontMetrics_def
        font: text_def.font
    }

    implicitWidth: Math.max(ExtSpacing.pixMediumIconSq, 3 * fontMetrics_def.height)
    implicitHeight: width
}
