import "impl"
import "../controls/minimal"
import "../fonts"
import "../layout"
import QtQuick 2.8
import QtQuick.Controls 2.1


Item {
    ExtColors {
        id: extColors_def
        schemeChoice: "def"
    }

    ExtColors {
        id: extColors_bright
        schemeChoice: "bright"
    }

    ExtColors {
        id: extColors_inverseDef
        schemeChoice: "inverseDef"
    }

    ExtColors {
        id: extColors_dark
        schemeChoice: "dark"
    }

    ExtColors {
        id: extColors_todo
        schemeChoice: "purpleGreen"
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

    Flickable {
        anchors.fill: parent
        contentWidth: contentItem.childrenRect.width
        contentHeight: contentItem.childrenRect.height

        ScrollBar.horizontal: ScrollBar_ {}
        ScrollBar.vertical: ScrollBar_ {}

        Grid {
            id: testGrid
            columns: 16
            spacing: extSpacing.pix1space

            Label { text: " " }
            Label { text: " " }
            Label { text: "1" }
            Label { text: "2" }
            Label { text: "3" }
            Label { text: "4" }
            Label { text: "5" }
            Label { text: "6" }
            Label { text: "7" }
            Label { text: "8" }
            Label { text: "9" }
            Label { text: "10" }
            Label { text: "11" }
            Label { text: "12" }
            Label { text: "13" }
            Label { text: "14" }

            Label { text: "<i>scheme</i> \\ color" }
            Label { text: " " }
            Label { text: "base" }
            Label { text: "alternateBase" }
            Label { text: "text" }
            Label { text: "window" }
            Label { text: "windowText" }
            Label { text: "button" }
            Label { text: "buttonText" }
            Label { text: "highlight" }
            Label { text: "highlightedText" }
            Label { text: "light" }
            Label { text: "midlight" }
            Label { text: "mid" }
            Label { text: "dark" }
            Label { text: "shadow" }


            //####################################################################################################################

            TestRectangle {}
            TestRectangle { Label { text: "active"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_def.activeC.base }
            TestRectangle { color: extColors_def.activeC.alternateBase }
            TestRectangle { color: extColors_def.activeC.text }
            TestRectangle { color: extColors_def.activeC.window }
            TestRectangle { color: extColors_def.activeC.windowText }
            TestRectangle { color: extColors_def.activeC.button }
            TestRectangle { color: extColors_def.activeC.buttonText }
            TestRectangle { color: extColors_def.activeC.highlight }
            TestRectangle { color: extColors_def.activeC.highlightedText }
            TestRectangle { color: extColors_def.activeC.light }
            TestRectangle { color: extColors_def.activeC.midlight }
            TestRectangle { color: extColors_def.activeC.mid }
            TestRectangle { color: extColors_def.activeC.dark }
            TestRectangle { color: extColors_def.activeC.shadow }

            TestRectangle { Label { text: extColors_def.schemeChoice; font.italic: true; anchors.centerIn: parent } }
            TestRectangle { Label { text: "inactive"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_def.inactiveC.base }
            TestRectangle { color: extColors_def.inactiveC.alternateBase }
            TestRectangle { color: extColors_def.inactiveC.text }
            TestRectangle { color: extColors_def.inactiveC.window }
            TestRectangle { color: extColors_def.inactiveC.windowText }
            TestRectangle { color: extColors_def.inactiveC.button }
            TestRectangle { color: extColors_def.inactiveC.buttonText }
            TestRectangle { color: extColors_def.inactiveC.highlight }
            TestRectangle { color: extColors_def.inactiveC.highlightedText }
            TestRectangle { color: extColors_def.inactiveC.light }
            TestRectangle { color: extColors_def.inactiveC.midlight }
            TestRectangle { color: extColors_def.inactiveC.mid }
            TestRectangle { color: extColors_def.inactiveC.dark }
            TestRectangle { color: extColors_def.inactiveC.shadow }

            TestRectangle {}
            TestRectangle { Label { text: "disabled"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_def.disabledC.base }
            TestRectangle { color: extColors_def.disabledC.alternateBase }
            TestRectangle { color: extColors_def.disabledC.text }
            TestRectangle { color: extColors_def.disabledC.window }
            TestRectangle { color: extColors_def.disabledC.windowText }
            TestRectangle { color: extColors_def.disabledC.button }
            TestRectangle { color: extColors_def.disabledC.buttonText }
            TestRectangle { color: extColors_def.disabledC.highlight }
            TestRectangle { color: extColors_def.disabledC.highlightedText }
            TestRectangle { color: extColors_def.disabledC.light }
            TestRectangle { color: extColors_def.disabledC.midlight }
            TestRectangle { color: extColors_def.disabledC.mid }
            TestRectangle { color: extColors_def.disabledC.dark }
            TestRectangle { color: extColors_def.disabledC.shadow }


            //####################################################################################################################

            TestRectangle {}
            TestRectangle { Label { text: "active"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_bright.activeC.base }
            TestRectangle { color: extColors_bright.activeC.alternateBase }
            TestRectangle { color: extColors_bright.activeC.text }
            TestRectangle { color: extColors_bright.activeC.window }
            TestRectangle { color: extColors_bright.activeC.windowText }
            TestRectangle { color: extColors_bright.activeC.button }
            TestRectangle { color: extColors_bright.activeC.buttonText }
            TestRectangle { color: extColors_bright.activeC.highlight }
            TestRectangle { color: extColors_bright.activeC.highlightedText }
            TestRectangle { color: extColors_bright.activeC.light }
            TestRectangle { color: extColors_bright.activeC.midlight }
            TestRectangle { color: extColors_bright.activeC.mid }
            TestRectangle { color: extColors_bright.activeC.dark }
            TestRectangle { color: extColors_bright.activeC.shadow }

            TestRectangle { Label { text: extColors_bright.schemeChoice; font.italic: true; anchors.centerIn: parent } }
            TestRectangle { Label { text: "inactive"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_bright.inactiveC.base }
            TestRectangle { color: extColors_bright.inactiveC.alternateBase }
            TestRectangle { color: extColors_bright.inactiveC.text }
            TestRectangle { color: extColors_bright.inactiveC.window }
            TestRectangle { color: extColors_bright.inactiveC.windowText }
            TestRectangle { color: extColors_bright.inactiveC.button }
            TestRectangle { color: extColors_bright.inactiveC.buttonText }
            TestRectangle { color: extColors_bright.inactiveC.highlight }
            TestRectangle { color: extColors_bright.inactiveC.highlightedText }
            TestRectangle { color: extColors_bright.inactiveC.light }
            TestRectangle { color: extColors_bright.inactiveC.midlight }
            TestRectangle { color: extColors_bright.inactiveC.mid }
            TestRectangle { color: extColors_bright.inactiveC.dark }
            TestRectangle { color: extColors_bright.inactiveC.shadow }

            TestRectangle {}
            TestRectangle { Label { text: "disabled"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_bright.disabledC.base }
            TestRectangle { color: extColors_bright.disabledC.alternateBase }
            TestRectangle { color: extColors_bright.disabledC.text }
            TestRectangle { color: extColors_bright.disabledC.window }
            TestRectangle { color: extColors_bright.disabledC.windowText }
            TestRectangle { color: extColors_bright.disabledC.button }
            TestRectangle { color: extColors_bright.disabledC.buttonText }
            TestRectangle { color: extColors_bright.disabledC.highlight }
            TestRectangle { color: extColors_bright.disabledC.highlightedText }
            TestRectangle { color: extColors_bright.disabledC.light }
            TestRectangle { color: extColors_bright.disabledC.midlight }
            TestRectangle { color: extColors_bright.disabledC.mid }
            TestRectangle { color: extColors_bright.disabledC.dark }
            TestRectangle { color: extColors_bright.disabledC.shadow }


            //####################################################################################################################

            TestRectangle {}
            TestRectangle { Label { text: "active"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_inverseDef.activeC.base }
            TestRectangle { color: extColors_inverseDef.activeC.alternateBase }
            TestRectangle { color: extColors_inverseDef.activeC.text }
            TestRectangle { color: extColors_inverseDef.activeC.window }
            TestRectangle { color: extColors_inverseDef.activeC.windowText }
            TestRectangle { color: extColors_inverseDef.activeC.button }
            TestRectangle { color: extColors_inverseDef.activeC.buttonText }
            TestRectangle { color: extColors_inverseDef.activeC.highlight }
            TestRectangle { color: extColors_inverseDef.activeC.highlightedText }
            TestRectangle { color: extColors_inverseDef.activeC.light }
            TestRectangle { color: extColors_inverseDef.activeC.midlight }
            TestRectangle { color: extColors_inverseDef.activeC.mid }
            TestRectangle { color: extColors_inverseDef.activeC.dark }
            TestRectangle { color: extColors_inverseDef.activeC.shadow }

            TestRectangle { Label { text: extColors_inverseDef.schemeChoice; font.italic: true; anchors.centerIn: parent } }
            TestRectangle { Label { text: "inactive"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_inverseDef.inactiveC.base }
            TestRectangle { color: extColors_inverseDef.inactiveC.alternateBase }
            TestRectangle { color: extColors_inverseDef.inactiveC.text }
            TestRectangle { color: extColors_inverseDef.inactiveC.window }
            TestRectangle { color: extColors_inverseDef.inactiveC.windowText }
            TestRectangle { color: extColors_inverseDef.inactiveC.button }
            TestRectangle { color: extColors_inverseDef.inactiveC.buttonText }
            TestRectangle { color: extColors_inverseDef.inactiveC.highlight }
            TestRectangle { color: extColors_inverseDef.inactiveC.highlightedText }
            TestRectangle { color: extColors_inverseDef.inactiveC.light }
            TestRectangle { color: extColors_inverseDef.inactiveC.midlight }
            TestRectangle { color: extColors_inverseDef.inactiveC.mid }
            TestRectangle { color: extColors_inverseDef.inactiveC.dark }
            TestRectangle { color: extColors_inverseDef.inactiveC.shadow }

            TestRectangle {}
            TestRectangle { Label { text: "disabled"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_inverseDef.disabledC.base }
            TestRectangle { color: extColors_inverseDef.disabledC.alternateBase }
            TestRectangle { color: extColors_inverseDef.disabledC.text }
            TestRectangle { color: extColors_inverseDef.disabledC.window }
            TestRectangle { color: extColors_inverseDef.disabledC.windowText }
            TestRectangle { color: extColors_inverseDef.disabledC.button }
            TestRectangle { color: extColors_inverseDef.disabledC.buttonText }
            TestRectangle { color: extColors_inverseDef.disabledC.highlight }
            TestRectangle { color: extColors_inverseDef.disabledC.highlightedText }
            TestRectangle { color: extColors_inverseDef.disabledC.light }
            TestRectangle { color: extColors_inverseDef.disabledC.midlight }
            TestRectangle { color: extColors_inverseDef.disabledC.mid }
            TestRectangle { color: extColors_inverseDef.disabledC.dark }
            TestRectangle { color: extColors_inverseDef.disabledC.shadow }


            //####################################################################################################################

            TestRectangle {}
            TestRectangle { Label { text: "active"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_dark.activeC.base }
            TestRectangle { color: extColors_dark.activeC.alternateBase }
            TestRectangle { color: extColors_dark.activeC.text }
            TestRectangle { color: extColors_dark.activeC.window }
            TestRectangle { color: extColors_dark.activeC.windowText }
            TestRectangle { color: extColors_dark.activeC.button }
            TestRectangle { color: extColors_dark.activeC.buttonText }
            TestRectangle { color: extColors_dark.activeC.highlight }
            TestRectangle { color: extColors_dark.activeC.highlightedText }
            TestRectangle { color: extColors_dark.activeC.light }
            TestRectangle { color: extColors_dark.activeC.midlight }
            TestRectangle { color: extColors_dark.activeC.mid }
            TestRectangle { color: extColors_dark.activeC.dark }
            TestRectangle { color: extColors_dark.activeC.shadow }

            TestRectangle { Label { text: extColors_dark.schemeChoice; font.italic: true; anchors.centerIn: parent } }
            TestRectangle { Label { text: "inactive"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_dark.inactiveC.base }
            TestRectangle { color: extColors_dark.inactiveC.alternateBase }
            TestRectangle { color: extColors_dark.inactiveC.text }
            TestRectangle { color: extColors_dark.inactiveC.window }
            TestRectangle { color: extColors_dark.inactiveC.windowText }
            TestRectangle { color: extColors_dark.inactiveC.button }
            TestRectangle { color: extColors_dark.inactiveC.buttonText }
            TestRectangle { color: extColors_dark.inactiveC.highlight }
            TestRectangle { color: extColors_dark.inactiveC.highlightedText }
            TestRectangle { color: extColors_dark.inactiveC.light }
            TestRectangle { color: extColors_dark.inactiveC.midlight }
            TestRectangle { color: extColors_dark.inactiveC.mid }
            TestRectangle { color: extColors_dark.inactiveC.dark }
            TestRectangle { color: extColors_dark.inactiveC.shadow }

            TestRectangle {}
            TestRectangle { Label { text: "disabled"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_dark.disabledC.base }
            TestRectangle { color: extColors_dark.disabledC.alternateBase }
            TestRectangle { color: extColors_dark.disabledC.text }
            TestRectangle { color: extColors_dark.disabledC.window }
            TestRectangle { color: extColors_dark.disabledC.windowText }
            TestRectangle { color: extColors_dark.disabledC.button }
            TestRectangle { color: extColors_dark.disabledC.buttonText }
            TestRectangle { color: extColors_dark.disabledC.highlight }
            TestRectangle { color: extColors_dark.disabledC.highlightedText }
            TestRectangle { color: extColors_dark.disabledC.light }
            TestRectangle { color: extColors_dark.disabledC.midlight }
            TestRectangle { color: extColors_dark.disabledC.mid }
            TestRectangle { color: extColors_dark.disabledC.dark }
            TestRectangle { color: extColors_dark.disabledC.shadow }


            //####################################################################################################################

            TestRectangle {}
            TestRectangle { Label { text: "active"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_todo.activeC.base }
            TestRectangle { color: extColors_todo.activeC.alternateBase }
            TestRectangle { color: extColors_todo.activeC.text }
            TestRectangle { color: extColors_todo.activeC.window }
            TestRectangle { color: extColors_todo.activeC.windowText }
            TestRectangle { color: extColors_todo.activeC.button }
            TestRectangle { color: extColors_todo.activeC.buttonText }
            TestRectangle { color: extColors_todo.activeC.highlight }
            TestRectangle { color: extColors_todo.activeC.highlightedText }
            TestRectangle { color: extColors_todo.activeC.light }
            TestRectangle { color: extColors_todo.activeC.midlight }
            TestRectangle { color: extColors_todo.activeC.mid }
            TestRectangle { color: extColors_todo.activeC.dark }
            TestRectangle { color: extColors_todo.activeC.shadow }

            TestRectangle { Label { text: extColors_todo.schemeChoice; font.italic: true; anchors.centerIn: parent } }
            TestRectangle { Label { text: "inactive"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_todo.inactiveC.base }
            TestRectangle { color: extColors_todo.inactiveC.alternateBase }
            TestRectangle { color: extColors_todo.inactiveC.text }
            TestRectangle { color: extColors_todo.inactiveC.window }
            TestRectangle { color: extColors_todo.inactiveC.windowText }
            TestRectangle { color: extColors_todo.inactiveC.button }
            TestRectangle { color: extColors_todo.inactiveC.buttonText }
            TestRectangle { color: extColors_todo.inactiveC.highlight }
            TestRectangle { color: extColors_todo.inactiveC.highlightedText }
            TestRectangle { color: extColors_todo.inactiveC.light }
            TestRectangle { color: extColors_todo.inactiveC.midlight }
            TestRectangle { color: extColors_todo.inactiveC.mid }
            TestRectangle { color: extColors_todo.inactiveC.dark }
            TestRectangle { color: extColors_todo.inactiveC.shadow }

            TestRectangle {}
            TestRectangle { Label { text: "disabled"; anchors.centerIn: parent } }
            TestRectangle { color: extColors_todo.disabledC.base }
            TestRectangle { color: extColors_todo.disabledC.alternateBase }
            TestRectangle { color: extColors_todo.disabledC.text }
            TestRectangle { color: extColors_todo.disabledC.window }
            TestRectangle { color: extColors_todo.disabledC.windowText }
            TestRectangle { color: extColors_todo.disabledC.button }
            TestRectangle { color: extColors_todo.disabledC.buttonText }
            TestRectangle { color: extColors_todo.disabledC.highlight }
            TestRectangle { color: extColors_todo.disabledC.highlightedText }
            TestRectangle { color: extColors_todo.disabledC.light }
            TestRectangle { color: extColors_todo.disabledC.midlight }
            TestRectangle { color: extColors_todo.disabledC.mid }
            TestRectangle { color: extColors_todo.disabledC.dark }
            TestRectangle { color: extColors_todo.disabledC.shadow }
        } // Grid
    } // Flickable
} // Item
