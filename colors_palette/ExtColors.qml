/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtColors {
        id: extColors // don't change this specifier!
        schemeChoice: "def"
    }
    \endcode
    Then you can refer to the various colors via e.g. extColors.activeC.button from everywhere below.
    The schemeChoice can be chosen to you liking.
    Important: stick to the specifier 'extColors' as it is also used by the library itself.
*/

import "impl"
import "schemes"
import QtQuick 2.7


Item {
    property string schemeChoice: "def" // choose one from scheme subfolder with lowercase first letter
    readonly property string schemePath: "schemes/" + schemeChoice + "/"

    //! The following colors are provided for states active, inactive and disabled.
    /**
        base: background for application window, text fields, combo boxes, grids, selected tabs, ...
        alternateBase: e.g. for two-colored background of grids
        text: foreground color for text on base background
        window: background for dialogs
        windowText: foreground for text in dialogs
        highlight: selected text background, active marking color (e.g. focus frames), could also be used
            as mixin-color (i.e. taking part in some gradient towards a 'usual' color) for special
            buttons/controls
        highlightText: foreground for text on highlight-background
        button, light, midlight, mid, dark: all can be used for button color, either pure or mixed (by gradient).
            Note that white is a common choice for light and mid and dark are the same in the Windows default
            palette. The Windows default button color is closest to midlight.
        shadow: is used for borders, and shadows obviously
        buttonText: foreground for text on buttons

        Design considerations.
        * 'accent color' should be understood as the various shades of button colors
        * provide a sufficient contrast between foreground and background (use tools to check)
        * make a wise choice of highlight color as this can be used to draw the users attention considerably
        * if in doubt, disabled state can also be achieved via 0.3 opacity
    */
    readonly property alias activeC: active_impl
    readonly property alias inactiveC: inactive_impl
    readonly property alias disabledC: disabled_impl


    QtObject {
        id: active_impl

        property color alternateBase: SysPalColorsActive.alternateBase
        property color base: SysPalColorsActive.base
        property color button: SysPalColorsActive.button
        property color buttonText: SysPalColorsActive.buttonText
        property color dark: SysPalColorsActive.dark
        property color highlight: SysPalColorsActive.highlight
        property color highlightedText: SysPalColorsActive.highlightedText
        property color light: SysPalColorsActive.light
        property color mid: SysPalColorsActive.mid
        property color midlight: SysPalColorsActive.midlight
        property color shadow: SysPalColorsActive.shadow
        property color text: SysPalColorsActive.text
        property color window: SysPalColorsActive.window
        property color windowText: SysPalColorsActive.windowText

        property real controlOptionalOpacity: 1.0
        property real controlOpacity: 1.0
    }

    QtObject {
        id: inactive_impl

        property color alternateBase: SysPalColorsInactive.alternateBase
        property color base: SysPalColorsInactive.base
        property color button: SysPalColorsInactive.button
        property color buttonText: SysPalColorsInactive.buttonText
        property color dark: SysPalColorsInactive.dark
        property color highlight: SysPalColorsInactive.highlight
        property color highlightedText: SysPalColorsInactive.highlightedText
        property color light: SysPalColorsInactive.light
        property color mid: SysPalColorsInactive.mid
        property color midlight: SysPalColorsInactive.midlight
        property color shadow: SysPalColorsInactive.shadow
        property color text: SysPalColorsInactive.text
        property color window: SysPalColorsInactive.window
        property color windowText: SysPalColorsInactive.windowText

        property real controlOptionalOpacity: 1.0
        property real controlOpacity: 1.0
    }

    QtObject {
        id: disabled_impl

        property color alternateBase: SysPalColorsDisabled.alternateBase
        property color base: SysPalColorsDisabled.base
        property color button: SysPalColorsDisabled.button
        property color buttonText: SysPalColorsDisabled.buttonText
        property color dark: SysPalColorsDisabled.dark
        property color highlight: SysPalColorsDisabled.highlight
        property color highlightedText: SysPalColorsDisabled.highlightedText
        property color light: SysPalColorsDisabled.light
        property color mid: SysPalColorsDisabled.mid
        property color midlight: SysPalColorsDisabled.midlight
        property color shadow: SysPalColorsDisabled.shadow
        property color text: SysPalColorsDisabled.text
        property color window: SysPalColorsDisabled.window
        property color windowText: SysPalColorsDisabled.windowText

        property real controlOptionalOpacity: 1.0
        property real controlOpacity: 0.5
    }


    state: schemeChoice

    states: [
        Def {
        },

        Todo {
        },

        CopyPasteTemplate {
        }
    ] // states
}
