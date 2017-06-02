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
    // Impl. note: although the font size is already scaled separately, the font metrics aren't yet.
    readonly property real charLikeMaxWidth: extFontMetrics.maximumCharacterWidth * extScale.factor
    readonly property real charLikeWidth: extFontMetrics.averageCharacterWidth * extScale.factor
    readonly property real charLikeHeight: extFontMetrics.height * extScale.factor
    readonly property real charxLikeHeight: extFontMetrics.xHeight * extScale.factor

    readonly property real space0: 0 * extScale.factor
    readonly property real space1: charxLikeHeight
    readonly property real space2: 2 * charxLikeHeight
    readonly property real space3: 3 * charxLikeHeight
    readonly property real space4: 4 * charxLikeHeight
    readonly property real space5: 5 * charxLikeHeight
    readonly property real space6: 6 * charxLikeHeight
    readonly property real space12: 12 * charxLikeHeight
    readonly property real space24: 24 * charxLikeHeight

    readonly property int pix1space: 1 //! non-custom-scaling
    readonly property int pix2space: 2 //! non-custom-scaling

    readonly property int wTinyIconSq: 16 * extScale.factor
    readonly property int wSmallIconSq: 24 * extScale.factor
    readonly property int wMediumIconSq: 32 * extScale.factor
    readonly property int wlargeIconSq: 48 * extScale.factor
    readonly property int wLargeIconSq: 64 * extScale.factor
    readonly property int wLARGEIconSq: 96 * extScale.factor
    readonly property int whugeIconSq: 128 * extScale.factor
    readonly property int wHugeIconSq: 256 * extScale.factor //! even huger should be achieved by multipliers 2, 4

    readonly property real wBorderWidth: pix1space //! non-custom-scaling
    readonly property real wBorderWidthSize2: pix2space //! non-custom-scaling
}
