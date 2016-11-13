import "minimal"
import "../colors_palette"
import "../fonts"
import "../layout"
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0


Window {
    width: 640
    height: 480
    visible: true

    ExtColors {
        id: extColors // don't change this specifier!
        schemeChoice: "def"
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

    Grid {
        columns: 4
        spacing: 1


        TestHelperBox {
            title: "Label_"
            Column {
                spacing: extSpacing.space3
                Label_ {
                    text: "Hello World!"
                }
                Label_ {
                    text: "Hello World!"
                    enabled: false
                }
            }
        }

        TestHelperBox {
            title: "TextField_"
            Column {
                spacing: extSpacing.space3
                TextField_ {
                    placeholderText: "placeholderText"
                }
                TextField_ {
                    placeholderText: "placeholderText"
                    text: "disabled real text"
                    enabled: false
                }
            }
        }

        TestHelperBox {
            title: "TextFieldLabelRow_"
            TextFieldLabelRow_ {
                placeholderText: "0"
                text: "some text"
                inputWidthInChars: 10
            }
        }
    }
}
