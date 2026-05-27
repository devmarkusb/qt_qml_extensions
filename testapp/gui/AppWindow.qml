/** You can take this file as a blueprint of how to make use of this qt qml extension lib
    in your own applications. Especially notice the hint for the Ext... declarations below.*/
import "."
import "../../colors_palette"
import "../../controls"
import "../../controls/minimal" // just for demonstrating ApplicationWindow_ here
import "../../core/os.js" as OS
import "../../fonts"
import "../../layout"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow_ {
    id: rootAppWindow

    // for experimenting
    //Draft {}

    //* Hint: The following Ext... global declarations are what you will mostly always need in all of your
    //        applications as well - alongside with the import according statements above.
    //!@{
    ExtColors {
        id: extColors // don't change this specifier!
        schemeChoice: "bright"
    }

    ExtFont {
        id: extFont // don't change this specifier!
        schemeChoice: "def"
    }

    ExtFontMetrics {
        id: extFontMetrics // don't change this specifier!
    }

    ExtScale {
        id: extScale // don't change this specifier!
    }

    ExtSpacing {
        id: extSpacing // don't change this specifier!
    }

    ExtControlsCfg {
        id: extControlsCfg // don't change this specifier!
    }
    //!@}

    QtObject {
        id: impl

        readonly property real defWindowWidth: Screen.width
        readonly property real defWindowHeight: Screen.height

        function logLoaderStatus(loader, pageName) {
            if (loader.status === Loader.Ready) {
                console.log(pageName + " page loaded:", loader.source)
            }
            if (loader.status === Loader.Error) {
                console.error(pageName + " page failed to load:", loader.source)
            }
        }
    }

    width: impl.defWindowWidth
    height: impl.defWindowHeight
    visible: true

    Component.onCompleted: {
        console.log("testapp diagnostic logs {")
        console.log("operating system:", OS.get_platform())
        console.log("}")
    }

    Button {
        objectName: "navigationBackButton"

        text: "Go back"
        Accessible.name: text
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        z: 1
        opacity: 0.8
        visible: pageSwitch.currentIndex !== 0
        onClicked: {
            pageSwitch.currentIndex = 0;
        }
    }

    StackLayout {
        id: pageSwitch

        currentIndex: 0
        anchors.fill: parent

        ColumnLayout {
            id: navPage

            Button {
                objectName: "navigationControlsButton"

                text: "Controls"
                Accessible.name: text
                onClicked: {
                    pageSwitch.currentIndex = 1;
                }
            }

            Button {
                objectName: "navigationLayoutButton"

                text: "Layout"
                Accessible.name: text
                onClicked: {
                    pageSwitch.currentIndex = 2;
                }
            }

            Button {
                objectName: "navigationColorsButton"

                text: "Colors"
                Accessible.name: text
                onClicked: {
                    pageSwitch.currentIndex = 3;
                }
            }

            Button {
                objectName: "navigationFontsButton"

                text: "Fonts"
                Accessible.name: text
                onClicked: {
                    pageSwitch.currentIndex = 4;
                }
            }
        } // ColumnLayout

        Loader {
            id: controlsPage

            Layout.fillWidth: true
            Layout.fillHeight: true
            active: pageSwitch.currentIndex === 1
            source: active ? Qt.resolvedUrl("../../controls/ControlsTest.qml") : ""
            onStatusChanged: impl.logLoaderStatus(controlsPage, "Controls")
        }

        Loader {
            id: layoutPage

            Layout.fillWidth: true
            Layout.fillHeight: true
            active: pageSwitch.currentIndex === 2
            source: active ? Qt.resolvedUrl("../../layout/ExtLayoutTest.qml") : ""
            onStatusChanged: impl.logLoaderStatus(layoutPage, "Layout")
        }

        Loader {
            id: colorsPage

            Layout.fillWidth: true
            Layout.fillHeight: true
            active: pageSwitch.currentIndex === 3
            source: active ? Qt.resolvedUrl("../../colors_palette/ExtColorsTest.qml") : ""
            onStatusChanged: impl.logLoaderStatus(colorsPage, "Colors")
        }

        Loader {
            id: fontPage

            Layout.fillWidth: true
            Layout.fillHeight: true
            active: pageSwitch.currentIndex === 4
            source: active ? Qt.resolvedUrl("../../fonts/ExtFontTest.qml") : ""
            onStatusChanged: impl.logLoaderStatus(fontPage, "Fonts")
        }
    } // StackLayout
} // ApplicationWindow_
