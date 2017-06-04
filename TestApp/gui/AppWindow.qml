//! You can take this file as a blueprint of how to make use of this qt qml extension lib
//! in your own applications. Especially notice the hint for the Ext... declarations below.
import "."
import "../../colors_palette"
import "../../controls"
import "../../fonts"
import "../../layout"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


//Draft {
//}
ApplicationWindow {
    id: rootAppWindow

    //! Hint: The following Ext... global declarations are what you will mostly always need in all of your
    //! applications as well - alongside with the import according statements above.
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

    width: extSpacing.twoThirdAvailableAppWidth
    height: extSpacing.twoThirdAvailableAppHeight

    visible: true

    property variant win
    property string qrcPrefixIfNeeded: cfgModel.isGUIonlyMode ? "../../" : "qrc:/"

    Component.onCompleted: {
    }

    ColumnLayout {
        Button {
            text: "Controls"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "controls/ControlsTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Layout"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "layout/ExtLayoutTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Colors"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "colors_palette/ExtColorsTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Fonts"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "fonts/ExtFontTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }
    }
}
