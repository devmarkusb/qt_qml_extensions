import "impl"
import "../controls/minimal"
import "../fonts"
import "../layout"
import QtQuick
import QtQuick.Controls


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

            TestLabel { text: " " }
            TestLabel { text: " " }
            TestLabel { text: "1" }
            TestLabel { text: "2" }
            TestLabel { text: "3" }
            TestLabel { text: "4" }
            TestLabel { text: "5" }
            TestLabel { text: "6" }
            TestLabel { text: "7" }
            TestLabel { text: "8" }
            TestLabel { text: "9" }
            TestLabel { text: "10" }
            TestLabel { text: "11" }
            TestLabel { text: "12" }
            TestLabel { text: "13" }
            TestLabel { text: "14" }

            TestLabel { text: "<i>scheme</i> \\ color" }
            TestLabel { text: " " }
            TestLabel { text: "base" }
            TestLabel { text: "alternateBase" }
            TestLabel { text: "text" }
            TestLabel { text: "window" }
            TestLabel { text: "windowText" }
            TestLabel { text: "button" }
            TestLabel { text: "buttonText" }
            TestLabel { text: "highlight" }
            TestLabel { text: "highlightedText" }
            TestLabel { text: "light" }
            TestLabel { text: "midlight" }
            TestLabel { text: "mid" }
            TestLabel { text: "dark" }
            TestLabel { text: "shadow" }


            //####################################################################################################################

            TestLabel {}
            TestLabel { text: "active" }
            TestLabel { color: extColors_def.activeC.base }
            TestLabel { color: extColors_def.activeC.alternateBase }
            TestLabel { color: extColors_def.activeC.text }
            TestLabel { color: extColors_def.activeC.window }
            TestLabel { color: extColors_def.activeC.windowText }
            TestLabel { color: extColors_def.activeC.button }
            TestLabel { color: extColors_def.activeC.buttonText }
            TestLabel { color: extColors_def.activeC.highlight }
            TestLabel { color: extColors_def.activeC.highlightedText }
            TestLabel { color: extColors_def.activeC.light }
            TestLabel { color: extColors_def.activeC.midlight }
            TestLabel { color: extColors_def.activeC.mid }
            TestLabel { color: extColors_def.activeC.dark }
            TestLabel { color: extColors_def.activeC.shadow }

            TestLabel { Label { text: extColors_def.schemeChoice; font.italic: true } }
            TestLabel { text: "inactive" }
            TestLabel { color: extColors_def.inactiveC.base }
            TestLabel { color: extColors_def.inactiveC.alternateBase }
            TestLabel { color: extColors_def.inactiveC.text }
            TestLabel { color: extColors_def.inactiveC.window }
            TestLabel { color: extColors_def.inactiveC.windowText }
            TestLabel { color: extColors_def.inactiveC.button }
            TestLabel { color: extColors_def.inactiveC.buttonText }
            TestLabel { color: extColors_def.inactiveC.highlight }
            TestLabel { color: extColors_def.inactiveC.highlightedText }
            TestLabel { color: extColors_def.inactiveC.light }
            TestLabel { color: extColors_def.inactiveC.midlight }
            TestLabel { color: extColors_def.inactiveC.mid }
            TestLabel { color: extColors_def.inactiveC.dark }
            TestLabel { color: extColors_def.inactiveC.shadow }

            TestLabel {}
            TestLabel { text: "disabled" }
            TestLabel { color: extColors_def.disabledC.base }
            TestLabel { color: extColors_def.disabledC.alternateBase }
            TestLabel { color: extColors_def.disabledC.text }
            TestLabel { color: extColors_def.disabledC.window }
            TestLabel { color: extColors_def.disabledC.windowText }
            TestLabel { color: extColors_def.disabledC.button }
            TestLabel { color: extColors_def.disabledC.buttonText }
            TestLabel { color: extColors_def.disabledC.highlight }
            TestLabel { color: extColors_def.disabledC.highlightedText }
            TestLabel { color: extColors_def.disabledC.light }
            TestLabel { color: extColors_def.disabledC.midlight }
            TestLabel { color: extColors_def.disabledC.mid }
            TestLabel { color: extColors_def.disabledC.dark }
            TestLabel { color: extColors_def.disabledC.shadow }


            //####################################################################################################################

            TestLabel {}
            TestLabel { text: "active" }
            TestLabel { color: extColors_bright.activeC.base }
            TestLabel { color: extColors_bright.activeC.alternateBase }
            TestLabel { color: extColors_bright.activeC.text }
            TestLabel { color: extColors_bright.activeC.window }
            TestLabel { color: extColors_bright.activeC.windowText }
            TestLabel { color: extColors_bright.activeC.button }
            TestLabel { color: extColors_bright.activeC.buttonText }
            TestLabel { color: extColors_bright.activeC.highlight }
            TestLabel { color: extColors_bright.activeC.highlightedText }
            TestLabel { color: extColors_bright.activeC.light }
            TestLabel { color: extColors_bright.activeC.midlight }
            TestLabel { color: extColors_bright.activeC.mid }
            TestLabel { color: extColors_bright.activeC.dark }
            TestLabel { color: extColors_bright.activeC.shadow }

            TestLabel { Label { text: extColors_bright.schemeChoice; font.italic: true } }
            TestLabel { text: "inactive" }
            TestLabel { color: extColors_bright.inactiveC.base }
            TestLabel { color: extColors_bright.inactiveC.alternateBase }
            TestLabel { color: extColors_bright.inactiveC.text }
            TestLabel { color: extColors_bright.inactiveC.window }
            TestLabel { color: extColors_bright.inactiveC.windowText }
            TestLabel { color: extColors_bright.inactiveC.button }
            TestLabel { color: extColors_bright.inactiveC.buttonText }
            TestLabel { color: extColors_bright.inactiveC.highlight }
            TestLabel { color: extColors_bright.inactiveC.highlightedText }
            TestLabel { color: extColors_bright.inactiveC.light }
            TestLabel { color: extColors_bright.inactiveC.midlight }
            TestLabel { color: extColors_bright.inactiveC.mid }
            TestLabel { color: extColors_bright.inactiveC.dark }
            TestLabel { color: extColors_bright.inactiveC.shadow }

            TestLabel {}
            TestLabel { text: "disabled" }
            TestLabel { color: extColors_bright.disabledC.base }
            TestLabel { color: extColors_bright.disabledC.alternateBase }
            TestLabel { color: extColors_bright.disabledC.text }
            TestLabel { color: extColors_bright.disabledC.window }
            TestLabel { color: extColors_bright.disabledC.windowText }
            TestLabel { color: extColors_bright.disabledC.button }
            TestLabel { color: extColors_bright.disabledC.buttonText }
            TestLabel { color: extColors_bright.disabledC.highlight }
            TestLabel { color: extColors_bright.disabledC.highlightedText }
            TestLabel { color: extColors_bright.disabledC.light }
            TestLabel { color: extColors_bright.disabledC.midlight }
            TestLabel { color: extColors_bright.disabledC.mid }
            TestLabel { color: extColors_bright.disabledC.dark }
            TestLabel { color: extColors_bright.disabledC.shadow }


            //####################################################################################################################

            TestLabel {}
            TestLabel { text: "active" }
            TestLabel { color: extColors_inverseDef.activeC.base }
            TestLabel { color: extColors_inverseDef.activeC.alternateBase }
            TestLabel { color: extColors_inverseDef.activeC.text }
            TestLabel { color: extColors_inverseDef.activeC.window }
            TestLabel { color: extColors_inverseDef.activeC.windowText }
            TestLabel { color: extColors_inverseDef.activeC.button }
            TestLabel { color: extColors_inverseDef.activeC.buttonText }
            TestLabel { color: extColors_inverseDef.activeC.highlight }
            TestLabel { color: extColors_inverseDef.activeC.highlightedText }
            TestLabel { color: extColors_inverseDef.activeC.light }
            TestLabel { color: extColors_inverseDef.activeC.midlight }
            TestLabel { color: extColors_inverseDef.activeC.mid }
            TestLabel { color: extColors_inverseDef.activeC.dark }
            TestLabel { color: extColors_inverseDef.activeC.shadow }

            TestLabel { Label { text: extColors_inverseDef.schemeChoice; font.italic: true } }
            TestLabel { text: "inactive" }
            TestLabel { color: extColors_inverseDef.inactiveC.base }
            TestLabel { color: extColors_inverseDef.inactiveC.alternateBase }
            TestLabel { color: extColors_inverseDef.inactiveC.text }
            TestLabel { color: extColors_inverseDef.inactiveC.window }
            TestLabel { color: extColors_inverseDef.inactiveC.windowText }
            TestLabel { color: extColors_inverseDef.inactiveC.button }
            TestLabel { color: extColors_inverseDef.inactiveC.buttonText }
            TestLabel { color: extColors_inverseDef.inactiveC.highlight }
            TestLabel { color: extColors_inverseDef.inactiveC.highlightedText }
            TestLabel { color: extColors_inverseDef.inactiveC.light }
            TestLabel { color: extColors_inverseDef.inactiveC.midlight }
            TestLabel { color: extColors_inverseDef.inactiveC.mid }
            TestLabel { color: extColors_inverseDef.inactiveC.dark }
            TestLabel { color: extColors_inverseDef.inactiveC.shadow }

            TestLabel {}
            TestLabel { text: "disabled" }
            TestLabel { color: extColors_inverseDef.disabledC.base }
            TestLabel { color: extColors_inverseDef.disabledC.alternateBase }
            TestLabel { color: extColors_inverseDef.disabledC.text }
            TestLabel { color: extColors_inverseDef.disabledC.window }
            TestLabel { color: extColors_inverseDef.disabledC.windowText }
            TestLabel { color: extColors_inverseDef.disabledC.button }
            TestLabel { color: extColors_inverseDef.disabledC.buttonText }
            TestLabel { color: extColors_inverseDef.disabledC.highlight }
            TestLabel { color: extColors_inverseDef.disabledC.highlightedText }
            TestLabel { color: extColors_inverseDef.disabledC.light }
            TestLabel { color: extColors_inverseDef.disabledC.midlight }
            TestLabel { color: extColors_inverseDef.disabledC.mid }
            TestLabel { color: extColors_inverseDef.disabledC.dark }
            TestLabel { color: extColors_inverseDef.disabledC.shadow }


            //####################################################################################################################

            TestLabel {}
            TestLabel { text: "active" }
            TestLabel { color: extColors_dark.activeC.base }
            TestLabel { color: extColors_dark.activeC.alternateBase }
            TestLabel { color: extColors_dark.activeC.text }
            TestLabel { color: extColors_dark.activeC.window }
            TestLabel { color: extColors_dark.activeC.windowText }
            TestLabel { color: extColors_dark.activeC.button }
            TestLabel { color: extColors_dark.activeC.buttonText }
            TestLabel { color: extColors_dark.activeC.highlight }
            TestLabel { color: extColors_dark.activeC.highlightedText }
            TestLabel { color: extColors_dark.activeC.light }
            TestLabel { color: extColors_dark.activeC.midlight }
            TestLabel { color: extColors_dark.activeC.mid }
            TestLabel { color: extColors_dark.activeC.dark }
            TestLabel { color: extColors_dark.activeC.shadow }

            TestLabel { Label { text: extColors_dark.schemeChoice; font.italic: true } }
            TestLabel { text: "inactive" }
            TestLabel { color: extColors_dark.inactiveC.base }
            TestLabel { color: extColors_dark.inactiveC.alternateBase }
            TestLabel { color: extColors_dark.inactiveC.text }
            TestLabel { color: extColors_dark.inactiveC.window }
            TestLabel { color: extColors_dark.inactiveC.windowText }
            TestLabel { color: extColors_dark.inactiveC.button }
            TestLabel { color: extColors_dark.inactiveC.buttonText }
            TestLabel { color: extColors_dark.inactiveC.highlight }
            TestLabel { color: extColors_dark.inactiveC.highlightedText }
            TestLabel { color: extColors_dark.inactiveC.light }
            TestLabel { color: extColors_dark.inactiveC.midlight }
            TestLabel { color: extColors_dark.inactiveC.mid }
            TestLabel { color: extColors_dark.inactiveC.dark }
            TestLabel { color: extColors_dark.inactiveC.shadow }

            TestLabel {}
            TestLabel { text: "disabled" }
            TestLabel { color: extColors_dark.disabledC.base }
            TestLabel { color: extColors_dark.disabledC.alternateBase }
            TestLabel { color: extColors_dark.disabledC.text }
            TestLabel { color: extColors_dark.disabledC.window }
            TestLabel { color: extColors_dark.disabledC.windowText }
            TestLabel { color: extColors_dark.disabledC.button }
            TestLabel { color: extColors_dark.disabledC.buttonText }
            TestLabel { color: extColors_dark.disabledC.highlight }
            TestLabel { color: extColors_dark.disabledC.highlightedText }
            TestLabel { color: extColors_dark.disabledC.light }
            TestLabel { color: extColors_dark.disabledC.midlight }
            TestLabel { color: extColors_dark.disabledC.mid }
            TestLabel { color: extColors_dark.disabledC.dark }
            TestLabel { color: extColors_dark.disabledC.shadow }


            //####################################################################################################################

            TestLabel {}
            TestLabel { text: "active" }
            TestLabel { color: extColors_todo.activeC.base }
            TestLabel { color: extColors_todo.activeC.alternateBase }
            TestLabel { color: extColors_todo.activeC.text }
            TestLabel { color: extColors_todo.activeC.window }
            TestLabel { color: extColors_todo.activeC.windowText }
            TestLabel { color: extColors_todo.activeC.button }
            TestLabel { color: extColors_todo.activeC.buttonText }
            TestLabel { color: extColors_todo.activeC.highlight }
            TestLabel { color: extColors_todo.activeC.highlightedText }
            TestLabel { color: extColors_todo.activeC.light }
            TestLabel { color: extColors_todo.activeC.midlight }
            TestLabel { color: extColors_todo.activeC.mid }
            TestLabel { color: extColors_todo.activeC.dark }
            TestLabel { color: extColors_todo.activeC.shadow }

            TestLabel { Label { text: extColors_todo.schemeChoice; font.italic: true } }
            TestLabel { text: "inactive" }
            TestLabel { color: extColors_todo.inactiveC.base }
            TestLabel { color: extColors_todo.inactiveC.alternateBase }
            TestLabel { color: extColors_todo.inactiveC.text }
            TestLabel { color: extColors_todo.inactiveC.window }
            TestLabel { color: extColors_todo.inactiveC.windowText }
            TestLabel { color: extColors_todo.inactiveC.button }
            TestLabel { color: extColors_todo.inactiveC.buttonText }
            TestLabel { color: extColors_todo.inactiveC.highlight }
            TestLabel { color: extColors_todo.inactiveC.highlightedText }
            TestLabel { color: extColors_todo.inactiveC.light }
            TestLabel { color: extColors_todo.inactiveC.midlight }
            TestLabel { color: extColors_todo.inactiveC.mid }
            TestLabel { color: extColors_todo.inactiveC.dark }
            TestLabel { color: extColors_todo.inactiveC.shadow }

            TestLabel {}
            TestLabel { text: "disabled" }
            TestLabel { color: extColors_todo.disabledC.base }
            TestLabel { color: extColors_todo.disabledC.alternateBase }
            TestLabel { color: extColors_todo.disabledC.text }
            TestLabel { color: extColors_todo.disabledC.window }
            TestLabel { color: extColors_todo.disabledC.windowText }
            TestLabel { color: extColors_todo.disabledC.button }
            TestLabel { color: extColors_todo.disabledC.buttonText }
            TestLabel { color: extColors_todo.disabledC.highlight }
            TestLabel { color: extColors_todo.disabledC.highlightedText }
            TestLabel { color: extColors_todo.disabledC.light }
            TestLabel { color: extColors_todo.disabledC.midlight }
            TestLabel { color: extColors_todo.disabledC.mid }
            TestLabel { color: extColors_todo.disabledC.dark }
            TestLabel { color: extColors_todo.disabledC.shadow }
        } // Grid
    } // Flickable
} // Item
