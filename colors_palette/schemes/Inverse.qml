import "../impl"
import QtQuick 2.8


State {
    name: "inverseDef"

    PropertyChanges {
        target: active_impl

        alternateBase: "#16181C"//F5F5F5//E9E7E3
        base: "#000000"//FFFFFF
        button: "#0F0F0F"//F0F0F0
        buttonText: "#FFFFFF"//000000
        dark: "#5F5F5F"//A0A0A0
        highlight: "#FF872F"//0078D7
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
        highlight: "#FF872F"//0078D7
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
}
