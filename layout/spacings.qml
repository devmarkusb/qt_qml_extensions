pragma Singleton
import QtQuick 2.7
import "../controls/QC1_def" //todo specific style choice in library?! Fonts need to get a correct handling yet.


Item {
    Text_ {
        id: textSingleton
    }

    FontMetrics {
        id: fontMetricsSingleton
        font: textSingleton.font
    }


    readonly property real charLikeMaxWidth: fontMetricsSingleton.maximumCharacterWidth
    readonly property real charLikeWidth: fontMetricsSingleton.averageCharacterWidth
    readonly property real charLikeHeight: fontMetricsSingleton.height
    readonly property real charxLikeHeight: fontMetricsSingleton.xHeight

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

    readonly property int pixTinyIconSq: 16
    readonly property int pixSmallIconSq: 24
    readonly property int pixMediumIconSq: 32
    readonly property int pixlargeIconSq: 48
    readonly property int pixLargeIconSq: 64
    readonly property int pixLARGEIconSq: 96
    readonly property int pixhugeIconSq: 128
    readonly property int pixHugeIconSq: 256 // even huger should be achieved by multipliers 2, 4
}
