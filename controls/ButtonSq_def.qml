import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../layout"


Button {
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
