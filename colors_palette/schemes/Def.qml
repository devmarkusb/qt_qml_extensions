//! System default colors.
//! Important observation: Some colors deviate when viewed with qmlscene compared to a real app environment.
//! The commented color codes concluding the lines are the colors measured when viewed in qmlscene in first place,
//! and - if there is a deviation - the measurement when viewed in an app.
//! So far on Windows its only the alternateBase colors that show such a deviation.
import "../impl"
import QtQuick 2.8


State {
    name: "def"

    PropertyChanges {
        target: active_impl

        alternateBase: SysPalColorsActive.alternateBase//F5F5F5//E9E7E3
        base: SysPalColorsActive.base//FFFFFF
        button: SysPalColorsActive.button//F0F0F0
        buttonText: SysPalColorsActive.buttonText//000000
        dark: SysPalColorsActive.dark//A0A0A0
        highlight: SysPalColorsActive.highlight//0078D7
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
        highlight: SysPalColorsDisabled.highlight//0078D7
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
}
