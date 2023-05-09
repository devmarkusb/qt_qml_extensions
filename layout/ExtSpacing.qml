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
import "../core/os.js" as OS


QtObject {
    //! Lowest most reasonable resolution (aspect ratio 3:2). Motivated by some early iPhone's.
    readonly property real minMostReasonable3to2AppWidth: OS.is_mobile() ? Screen.width : 480
    readonly property real minMostReasonable3to2AppHeight: OS.is_mobile() ? Screen.height : 320
    //! Lowest but not most reasonable resolution (aspect ratio 4:3).
    readonly property real min4to3AppWidth: OS.is_mobile() ? Screen.width : 320
    readonly property real min4to3AppHeight: OS.is_mobile() ? Screen.width : 240
    //! Useful for making app window occupy 2/3 of the available screen space. Golden ratio would be about 0.618.
    /** Impl. note: desktopAvailableWidth/Height aren't a good choice, as they sum up multi monitors.*/
    readonly property real twoThirdAvailableAppWidth: Screen.width * 0.66
    readonly property real twoThirdAvailableAppHeight: Screen.height * 0.66

    /** Note, it doesn't seem to be a good idea to take these font metrics or even the default font's point/pixel
        size as a foundation for platform independent and scaling respecting choice of spacing. Unfortunately
        for calculating space for text lengths and heights there is no other choice.
        E.g. there are already ugly seemingly unrelated differences between Windows and Windows-UWP affecting
        all these parameters with varying factors.*/
    // Impl. note: although the font size is already scaled separately, the font metrics aren't yet.
    readonly property real charLikeMaxWidth: extFontMetrics.maximumCharacterWidth * extScale.factor
    readonly property real charLikeWidth: extFontMetrics.averageCharacterWidth * extScale.factor
    readonly property real charLikeHeight: extFontMetrics.height * extScale.factor
    readonly property real charxLikeHeight: extFontMetrics.xHeight * extScale.factor

    readonly property real space0: 0 * extScale.factor
    readonly property real space1: extScale.dp2p(3) // observed as charxLikeHeight_deprecated for an 11pt font
    readonly property real space2: 2 * space1
    readonly property real space3: 3 * space1
    readonly property real space4: 4 * space1
    readonly property real space5: 5 * space1
    readonly property real space6: 6 * space1
    readonly property real space12: 12 * space1
    readonly property real space24: 24 * space1

    readonly property real wTinyIconSq: extScale.dp2p(16)
    readonly property real wSmallIconSq: extScale.dp2p(24)
    readonly property real wMediumIconSq: extScale.dp2p(32)
    readonly property real wlargeIconSq: extScale.dp2p(48)
    readonly property real wLargeIconSq: extScale.dp2p(64)
    readonly property real wLARGEIconSq: extScale.dp2p(96)
    readonly property real whugeIconSq: extScale.dp2p(128)
    readonly property real wHugeIconSq: extScale.dp2p(256) //! even huger should be achieved by multipliers 2, 4


    //### non scaling properties ###
    /** The following spacings are non-scaling (not via logical ppi like Windows scale factor and also not via custom factor of extScale).
        They are mostly used for borders, separators, and all kind of spacing situations that wouldn't look good or waste too much space
        if being scaled.
        These constants start with 'pix' prefix to express their pixel-perfect behavior.*/
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
