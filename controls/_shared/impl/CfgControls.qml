import QtQuick 2.8


QtObject {
    readonly property real rCommonControlRadius: 5.0

    readonly property real wButtonWidth: 20.0 * extSpacing.charLikeWidth
    readonly property real wButtonImplicitWidthFactor: 1.25 //! times the label-determined width
    // Impl. note: tried extScale.mm2p(extScale.custom_scaled(8)) on recommendation of 0.8cm button height,
    // and this also seems to work properly - even with Windows scale factors. (Corresponds approx. to a
    // 2.3 factor instead of 2.0.)
    readonly property real hButtonHeight: 2.0 * extSpacing.charLikeHeight

    readonly property real sqButtonSideLength: 3.0 * extSpacing.charLikeHeight

    readonly property real wRadioButtonWidth: 1.6 * extSpacing.charLikeHeight
    readonly property real wRadioButtonInnerWidth: extSpacing.charLikeHeight + 1
    readonly property real rRadioButtonRadius: extSpacing.charLikeHeight
    readonly property real rRadioButtonInnerRadius: extSpacing.charLikeHeight

    readonly property real wCheckBoxWidth: 1.6 * extSpacing.charLikeHeight

    readonly property real wTextFieldWidth: extSpacing.charLikeWidth * 25
    readonly property real hTextFieldHeight: hButtonHeight

    readonly property real hSpinIndicatorHeight: hTextFieldHeight
    readonly property real wSpinIndicatorWidth: hSpinIndicatorHeight

    readonly property real hSwitchHeight: hTextFieldHeight

    readonly property real wScrollBarWidth: rRadioButtonRadius

    readonly property real hComboBoxIndicatorHeight: hTextFieldHeight - extSpacing.pix2space * 2
    readonly property real wComboBoxIndicatorWidth: hComboBoxIndicatorHeight / 2
}
