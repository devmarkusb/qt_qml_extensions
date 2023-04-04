/** You can take this file as a blueprint of how to make use of this qt qml extension lib
    in your own applications. Especially notice the hint for the Ext... declarations below.*/
import "."
import "../../colors_palette"
import "../../controls"
import "../../controls/minimal" // just for demonstrating ApplicationWindow_ here
import "../../core/os.js" as OS
import "../../fonts"
import "../../layout"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

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

        readonly property real defWindowWidth: extSpacing.twoThirdAvailableAppWidth
        readonly property real defWindowHeight: extSpacing.twoThirdAvailableAppHeight
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
        text: "Go back"
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
        Layout.fillWidth: true
        Layout.fillHeight: true

        ColumnLayout {
            id: navPage

            Button {
                text: "Controls"
                onClicked: {
                    pageSwitch.currentIndex = 1;
                }
            }

            Button {
                text: "Layout"
                onClicked: {
                    pageSwitch.currentIndex = 2;
                }
            }

            Button {
                text: "Colors"
                onClicked: {
                    pageSwitch.currentIndex = 3;
                }
            }

            Button {
                text: "Fonts"
                onClicked: {
                    pageSwitch.currentIndex = 4;
                }
            }
        } // ColumnLayout

        ControlsTest {
            id: controlsTest
        }

        ExtLayoutTest {
            id: layoutTest
        }

        ExtColorsTest {
            id: colorsTest
        }

        ExtFontTest {
            id: fontTest
        }
    } // StackLayout
} // ApplicationWindow_
