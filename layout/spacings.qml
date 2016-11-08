pragma Singleton
import QtQuick 2.7
import "../controls"

Item {
    Text_def {
        id: text_def
    }

    FontMetrics {
        id: fontMetrics_def
        font: text_def.font
    }


    readonly property real charLikeMaxWidth: fontMetrics_def.maximumCharacterWidth
    readonly property real charLikeWidth: fontMetrics_def.averageCharacterWidth
    readonly property real charLikeHeight: fontMetrics_def.height
    readonly property real charxLikeHeight: fontMetrics_def.xHeight

    readonly property real space0: 0
    readonly property real space1: charxLikeHeight
    readonly property real space2: 2 * charxLikeHeight
    readonly property real space3: 3 * charxLikeHeight
    readonly property real space4: 4 * charxLikeHeight
    readonly property real space5: 5 * charxLikeHeight
    readonly property real space6: 6 * charxLikeHeight
    readonly property real space12: 12 * charxLikeHeight
    readonly property real space24: 24 * charxLikeHeight

    readonly property int pix1space: 1
    readonly property int pix2space: 2

    readonly property int pixMediumIconSq: 48
}
