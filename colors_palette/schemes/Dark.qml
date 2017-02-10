import "../impl"
import QtQuick 2.8


State {
    name: "dark"

    PropertyChanges {
        target: active_impl

        alternateBase: "#303030"//16181C
        base: "#1E1E1E"//000000
        button: "#1E1E1E"//0F0F0F
        buttonText: "#DCDCDC"//FFFFFF
        dark: "#5F5F5F"//5F5F5F
        highlight: "#0078D7"//FF872F
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
        highlight: "#0078D7"//FF872F
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
}
