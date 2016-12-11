import QtQuick 2.7


QtObject {
    readonly property real rCommonControlRadius: 5

    readonly property real wButtonWidth: 25 * extSpacing.charLikeWidth
    readonly property real hButtonHeight: 2 * extSpacing.charLikeHeight

    readonly property real sqButtonSideLength: 3 * extSpacing.charLikeHeight

    readonly property real wRadioButtonWidth: 1.6 * extSpacing.charLikeHeight
    readonly property real wRadioButtonInnerWidth: extSpacing.charLikeHeight + 1
    readonly property real rRadioButtonRadius: extSpacing.charLikeHeight
    readonly property real rRadioButtonInnerRadius: extSpacing.charLikeHeight

    readonly property real wCheckBoxWidth: 1.6 * extSpacing.charLikeHeight

    readonly property real wTextFieldWidth: extSpacing.charLikeWidth * 20
    readonly property real hTextFieldHeight: 2 * extSpacing.charLikeHeight

    readonly property real hSpinIndicatorHeight: hTextFieldHeight
    readonly property real wSpinIndicatorWidth: hSpinIndicatorHeight

    readonly property real hSwitchHeight: hTextFieldHeight

    readonly property real wScrollBarWidth: rRadioButtonRadius
}
