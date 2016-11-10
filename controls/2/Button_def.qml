import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    Text_def {
        id: text_def
    }

    FontMetrics {
        id: fontMetrics_def
        font: text_def.font
    }

    implicitHeight: 2.5 * fontMetrics_def.height
    implicitWidth: 25 * fontMetrics_def.averageCharacterWidth
}
