import "impl"
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4


Window {
    ExtColors {
        id: extColors_def
        schemeChoice: "def"
    }
    ExtColors {
        id: extColors_todo
        schemeChoice: "purple_green"
    }

    width: testGrid.width
    height: testGrid.height

    Grid {
        id: testGrid
        columns: 16
        spacing: 1

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
    }
}
