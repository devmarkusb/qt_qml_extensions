import QtQuick 2.7
import QtQuick.Controls 2.0


Button {
    Text_ {
        id: Text_
    }

    FontMetrics {
        id: fontMetrics_def
        font: Text_.font
    }

    implicitHeight: 2.5 * fontMetrics_def.height
    implicitWidth: 25 * fontMetrics_def.averageCharacterWidth
}
