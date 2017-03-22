//! This scheme is the exact result of Windows system default colors as measured within the colors test app.
import "../impl"
import QtQuick 2.8


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
}
