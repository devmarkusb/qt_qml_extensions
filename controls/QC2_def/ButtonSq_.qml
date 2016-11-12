import "../../layout"
import QtQuick 2.7


Button_ {
    Text_ {
        id: Text_
    }

    FontMetrics {
        id: fontMetrics_def
        font: Text_.font
    }

    implicitWidth: Math.max(ExtSpacing.pixMediumIconSq, 3 * fontMetrics_def.height)
    implicitHeight: width
}
