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
