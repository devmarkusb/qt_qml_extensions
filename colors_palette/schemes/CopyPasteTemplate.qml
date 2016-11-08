import "../impl"
import QtQuick 2.7


State {
    name: "copyPasteTemplate"

    PropertyChanges {
        target: active_impl

        alternateBase: SysPalColorsActive.alternateBase
        base: SysPalColorsActive.base
        button: SysPalColorsActive.button
        buttonText: SysPalColorsActive.buttonText
        dark: SysPalColorsActive.dark
        highlight: SysPalColorsActive.highlight
        highlightedText: SysPalColorsActive.highlightedText
        light: SysPalColorsActive.light
        mid: SysPalColorsActive.mid
        midlight: SysPalColorsActive.midlight
        shadow: SysPalColorsActive.shadow
        text: SysPalColorsActive.text
        window: SysPalColorsActive.window
        windowText: SysPalColorsActive.windowText
    }

    PropertyChanges {
        target: inactive_impl

        alternateBase: SysPalColorsInactive.alternateBase
        base: SysPalColorsInactive.base
        button: SysPalColorsInactive.button
        buttonText: SysPalColorsInactive.buttonText
        dark: SysPalColorsInactive.dark
        highlight: SysPalColorsInactive.highlight
        highlightedText: SysPalColorsInactive.highlightedText
        light: SysPalColorsInactive.light
        mid: SysPalColorsInactive.mid
        midlight: SysPalColorsInactive.midlight
        shadow: SysPalColorsInactive.shadow
        text: SysPalColorsInactive.text
        window: SysPalColorsInactive.window
        windowText: SysPalColorsInactive.windowText
    }

    PropertyChanges {
        target: disabled_impl

        alternateBase: SysPalColorsDisabled.alternateBase
        base: SysPalColorsDisabled.base
        button: SysPalColorsDisabled.button
        buttonText: SysPalColorsDisabled.buttonText
        dark: SysPalColorsDisabled.dark
        highlight: SysPalColorsDisabled.highlight
        highlightedText: SysPalColorsDisabled.highlightedText
        light: SysPalColorsDisabled.light
        mid: SysPalColorsDisabled.mid
        midlight: SysPalColorsDisabled.midlight
        shadow: SysPalColorsDisabled.shadow
        text: SysPalColorsDisabled.text
        window: SysPalColorsDisabled.window
        windowText: SysPalColorsDisabled.windowText
    }
}
