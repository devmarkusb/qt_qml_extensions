/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtSpacing {
        id: extSpacing // don't change this specifier!
    }
    \endcode
    Then you can refer to your global spacings via e.g. extSpacing.space3 from everywhere below.
    Important: stick to the specifier 'extSpacing' as it is also used by the library itself.
*/
import QtQuick 2.8


QtObject {
    readonly property real charLikeMaxWidth: extFontMetrics.maximumCharacterWidth
    readonly property real charLikeWidth: extFontMetrics.averageCharacterWidth
    readonly property real charLikeHeight: extFontMetrics.height
    readonly property real charxLikeHeight: extFontMetrics.xHeight

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

    readonly property real wBorderWidth: pix1space
    readonly property real wBorderWidthSize2: pix2space
}
