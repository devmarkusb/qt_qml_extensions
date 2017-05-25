import "../../colors_palette"
import "../../controls"
import "../../fonts"
import "../../layout"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


ApplicationWindow {
    id: rootAppWindow

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

    ExtSpacing {
        id: extSpacing // don't change this specifier!
    }

    ExtControlsCfg {
        id: extControlsCfg // don't change this specifier!
    }

    width: 640
    height: 480

    visible: true

    property variant win
    property string qrcPrefixIfNeeded: cfgModel.isGUIonlyMode ? "" : "qrc:/"

    Component.onCompleted: {
    }

    ColumnLayout {
        Button {
            text: "Controls"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "../../controls/ControlsTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Layout"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "../../layout/ExtLayoutTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Colors"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "../../colors_palette/ExtColorsTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }

        Button {
            text: "Fonts"

            onClicked: {
                var component = Qt.createComponent(qrcPrefixIfNeeded + "../../fonts/ExtFontTest.qml");
                win = component.createObject(rootAppWindow);
                win.show();
            }
        }
    }
}
