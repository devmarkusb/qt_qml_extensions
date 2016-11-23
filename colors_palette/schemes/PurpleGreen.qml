import "../impl"
import QtQuick 2.7


State {
    name: "purple_green"

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
