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
import QtQuick


Item {
    property string schemeChoice: "def" // choose one from scheme subfolder with lowercase first letter

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

    signal textActiveColorChanged()


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

        onTextChanged: {
            textActiveColorChanged()
        }
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
        State {
            name: "def"

            PropertyChanges {
                target: active_impl

                alternateBase: SysPalColorsActive.alternateBase//F5F5F5//E9E7E3
                base: SysPalColorsActive.base//FFFFFF
                button: SysPalColorsActive.button//F0F0F0
                buttonText: SysPalColorsActive.buttonText//000000
                dark: SysPalColorsActive.dark//A0A0A0
                highlight: SysPalColorsActive.highlight//3399FF // strange: this randomly seems to change to #0078D7 occasionally
                highlightedText: SysPalColorsActive.highlightedText//FFFFFF
                light: SysPalColorsActive.light//FFFFFF
                mid: SysPalColorsActive.mid//A0A0A0
                midlight: SysPalColorsActive.midlight//E3E3E3
                shadow: SysPalColorsActive.shadow//696969
                text: SysPalColorsActive.text//000000
                window: SysPalColorsActive.window//F0F0F0
                windowText: SysPalColorsActive.windowText//000000

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: inactive_impl

                alternateBase: SysPalColorsInactive.alternateBase//F5F5F5//E9E7E3
                base: SysPalColorsInactive.base//FFFFFF
                button: SysPalColorsInactive.button//F0F0F0
                buttonText: SysPalColorsInactive.buttonText//000000
                dark: SysPalColorsInactive.dark//A0A0A0
                highlight: SysPalColorsInactive.highlight//F0F0F0
                highlightedText: SysPalColorsInactive.highlightedText//000000
                light: SysPalColorsInactive.light//FFFFFF
                mid: SysPalColorsInactive.mid//A0A0A0
                midlight: SysPalColorsInactive.midlight//E3E3E3
                shadow: SysPalColorsInactive.shadow//696969
                text: SysPalColorsInactive.text//000000
                window: SysPalColorsInactive.window//F0F0F0
                windowText: SysPalColorsInactive.windowText//000000

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: disabled_impl

                alternateBase: SysPalColorsDisabled.alternateBase//F5F5F5//F7F7F7
                base: SysPalColorsDisabled.base//F0F0F0
                button: SysPalColorsDisabled.button//F0F0F0
                buttonText: SysPalColorsDisabled.buttonText//787878
                dark: SysPalColorsDisabled.dark//A0A0A0
                highlight: SysPalColorsDisabled.highlight//3399FF
                highlightedText: SysPalColorsDisabled.highlightedText//FFFFFF
                light: SysPalColorsDisabled.light//FFFFFF
                mid: SysPalColorsDisabled.mid//A0A0A0
                midlight: SysPalColorsDisabled.midlight//F7F7F7
                shadow: SysPalColorsDisabled.shadow//000000
                text: SysPalColorsDisabled.text//787878
                window: SysPalColorsDisabled.window//F0F0F0
                windowText: SysPalColorsDisabled.windowText//787878

                controlOptionalOpacity: 0.5
                controlOpacity: 0.5
            }
        },
        State {
            name: "bright"

            PropertyChanges {
                target: active_impl

                alternateBase: "#E9E7E3"
                base: "#FFFFFF"
                button: "#F0F0F0"
                buttonText: "#000000"
                dark: "#A0A0A0"
                highlight: "#3399FF"
                highlightedText: "#FFFFFF"
                light: "#FFFFFF"
                mid: "#A0A0A0"
                midlight: "#E3E3E3"
                shadow: "#696969"
                text: "#000000"
                window: "#F0F0F0"
                windowText: "#000000"

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: inactive_impl

                alternateBase: "#E9E7E3"
                base: "#FFFFFF"
                button: "#F0F0F0"
                buttonText: "#000000"
                dark: "#A0A0A0"
                highlight: "#F0F0F0"
                highlightedText: "#000000"
                light: "#FFFFFF"
                mid: "#A0A0A0"
                midlight: "#E3E3E3"
                shadow: "#696969"
                text: "#000000"
                window: "#F0F0F0"
                windowText: "#000000"

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: disabled_impl

                alternateBase: "#F7F7F7"
                base: "#F0F0F0"
                button: "#F0F0F0"
                buttonText: "#787878"
                dark: "#A0A0A0"
                highlight: "#3399FF"
                highlightedText: "#FFFFFF"
                light: "#FFFFFF"
                mid: "#A0A0A0"
                midlight: "#F7F7F7"
                shadow: "#000000"
                text: "#787878"
                window: "#F0F0F0"
                windowText: "#787878"

                controlOptionalOpacity: 0.5
                controlOpacity: 0.5
            }
        },
        State {
            name: "inverseDef"

            PropertyChanges {
                target: active_impl

                alternateBase: "#16181C"//F5F5F5//E9E7E3
                base: "#000000"//FFFFFF
                button: "#0F0F0F"//F0F0F0
                buttonText: "#FFFFFF"//000000
                dark: "#5F5F5F"//A0A0A0
                highlight: "#CC6600"//3399FF
                highlightedText: "#000000"//FFFFFF
                light: "#000000"//FFFFFF
                mid: "#5F5F5F"//A0A0A0
                midlight: "#1C1C1C"//E3E3E3
                shadow: "#969696"//696969
                text: "#FFFFFF"//000000
                window: "#0F0F0F"//F0F0F0
                windowText: "#FFFFFF"//000000

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: inactive_impl

                alternateBase: "#16181C"//F5F5F5//E9E7E3
                base: "#000000"//FFFFFF
                button: "#0F0F0F"//F0F0F0
                buttonText: "#FFFFFF"//000000
                dark: "#5F5F5F"//A0A0A0
                highlight: "#0F0F0F"//F0F0F0
                highlightedText: "#FFFFFF"//000000
                light: "#000000"//FFFFFF
                mid: "#5F5F5F"//A0A0A0
                midlight: "#1C1C1C"//E3E3E3
                shadow: "#969696"//696969
                text: "#FFFFFF"//000000
                window: "#0F0F0F"//F0F0F0
                windowText: "#FFFFFF"//000000

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: disabled_impl

                alternateBase: "#080808"//F5F5F5//F7F7F7
                base: "#0F0F0F"//F0F0F0
                button: "#0F0F0F"//F0F0F0
                buttonText: "#878787"//787878
                dark: "#5F5F5F"//A0A0A0
                highlight: "#CC6600"//3399FF
                highlightedText: "#000000"//FFFFFF
                light: "#000000"//FFFFFF
                mid: "#5F5F5F"//A0A0A0
                midlight: "#080808"//F7F7F7
                shadow: "#FFFFFF"//000000
                text: "#878787"//787878
                window: "#0F0F0F"//F0F0F0
                windowText: "#878787"//787878

                controlOptionalOpacity: 0.5
                controlOpacity: 0.5
            }
        },
        State {
            name: "dark"

            PropertyChanges {
                target: active_impl

                alternateBase: "#303030"//16181C
                base: "#1E1E1E"//000000
                button: "#1E1E1E"//0F0F0F
                buttonText: "#DCDCDC"//FFFFFF
                dark: "#5F5F5F"//5F5F5F
                highlight: "#3399FF"//CC6600
                highlightedText: "#FFFFFF"//000000
                light: "#000000"//000000
                mid: "#4F4F4F"//5F5F5F
                midlight: "#2C2C2C"//1C1C1C
                shadow: "#868686"//969696
                text: "#DCDCDC"//FFFFFF
                window: "#0F0F0F"//0F0F0F
                windowText: "#DCDCDC"//FFFFFF

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: inactive_impl

                alternateBase: "#303030"//16181C
                base: "#1E1E1E"//000000
                button: "#1E1E1E"//0F0F0F
                buttonText: "#DCDCDC"//FFFFFF
                dark: "#5F5F5F"//5F5F5F
                highlight: "#0F0F0F"//0F0F0F
                highlightedText: "#FFFFFF"//FFFFFF
                light: "#000000"//000000
                mid: "#4F4F4F"//5F5F5F
                midlight: "#2C2C2C"//1C1C1C
                shadow: "#868686"//969696
                text: "#DCDCDC"//FFFFFF
                window: "#0F0F0F"//0F0F0F
                windowText: "#DCDCDC"//FFFFFF

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: disabled_impl

                alternateBase: "#202020"//080808
                base: "#2E2E2E"//0F0F0F
                button: "#1E1E1E"//0F0F0F
                buttonText: "#878787"//878787
                dark: "#5F5F5F"//5F5F5F
                highlight: "#3399FF"//CC6600
                highlightedText: "#FFFFFF"//000000
                light: "#000000"//000000
                mid: "#4F4F4F"//5F5F5F
                midlight: "#181818"//080808
                shadow: "#EFEFEF"//FFFFFF
                text: "#878787"//878787
                window: "#0F0F0F"//F0F0F0
                windowText: "#878787"//878787

                controlOptionalOpacity: 0.5
                controlOpacity: 0.5
            }
        },
        State {
            name: "purpleGreen"

            PropertyChanges {
                target: active_impl

                alternateBase: "#10AD46"
                base: "#54E085"
                button: "#B378FF"
                buttonText: "white"
                dark: "#220042"
                highlight: "#EDA12C"
                highlightedText: "black"
                light: "white"
                mid: "#430082"
                midlight: "#7300E0"
                shadow: "black"
                text: "black"
                window: "#10AD46"
                windowText: "black"

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: inactive_impl

                alternateBase: "#10AD46"
                base: "#54E085"
                button: "#B378FF"
                buttonText: "white"
                dark: "#220042"
                highlight: "#A9A82E"
                highlightedText: "#303030"
                light: "white"
                mid: "#430082"
                midlight: "#7300E0"
                shadow: "black"
                text: "black"
                window: "#10AD46"
                windowText: "black"

                controlOptionalOpacity: 1.0
                controlOpacity: 1.0
            }

            PropertyChanges {
                target: disabled_impl

                alternateBase: "#10AD46"
                base: "#10AD46"
                button: "#B378FF"
                buttonText: "white"
                dark: "#220042"
                highlight: "#EDA12C"
                highlightedText: "black"
                light: "white"
                mid: "#430082"
                midlight: "#B378FF"
                shadow: "black"
                text: "#303030"
                window: "#10AD46"
                windowText: "#303030"

                controlOptionalOpacity: 1.0
                controlOpacity: 0.5
            }
        }
    ] // states
}
