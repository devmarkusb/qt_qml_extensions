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
import QtQuick.Window 2.2


QtObject {
    //! Lowest most reasonable resolution.
    readonly property real minMostReasonable3to2AppWidth: 480
    readonly property real minMostReasonable3to2AppHeight: 320
    //! Lowest but not most reasonable resolution.
    readonly property real min4to3AppWidth: 320
    readonly property real min4to3AppHeight: 240
    //! Useful for making app window occupy 2/3 of the available screen space. Golden ratio would be about 0.618.
    readonly property real twoThirdAvailableAppWidth: Screen.desktopAvailableWidth * 0.66
    readonly property real twoThirdAvailableAppHeight: Screen.desktopAvailableHeight * 0.66

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

    readonly property real wTinyIconSq: 16 * extScale.factor
    readonly property real wSmallIconSq: 24 * extScale.factor
    readonly property real wMediumIconSq: 32 * extScale.factor
    readonly property real wlargeIconSq: 48 * extScale.factor
    readonly property real wLargeIconSq: 64 * extScale.factor
    readonly property real wLARGEIconSq: 96 * extScale.factor
    readonly property real whugeIconSq: 128 * extScale.factor
    readonly property real wHugeIconSq: 256 * extScale.factor //! even huger should be achieved by multipliers 2, 4


    //### non scaling properties ###
    //! The following spacings are non-scaling (not via logical ppi like Windows scale factor and also not via custom factor of extScale).
    //! They are mostly used for borders, separators, and all kind of spacing situations that wouldn't look good or waste too much space
    //! if being scaled.
    //! These constants start with 'pix' prefix to express their pixel-perfect behavior.
    //!@{

    readonly property real pix0space: 0
    readonly property real pix1space: 1
    readonly property real pix2space: 2
    readonly property real pix3space: 3
    readonly property real pix4space: 4
    readonly property real pix5space: 5

    readonly property real pixBorderWidth: pix1space
    readonly property real pixBorderWidthSize2: pix2space

    //! Useful for grids, row, columns, tables.
    readonly property real pixLayoutSpacing: pix2space
    readonly property real pixLayoutSpacingX2: pix2space * 2
    //!@}
}
