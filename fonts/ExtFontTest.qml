import "../layout"
import "impl"
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4


Window {
    readonly property string exampleText: "Hello World!"
    readonly property string examplePlayground: "012345679.:?!_oO0_1lL"

    ExtFont {
        id: extFont_defQC1
        schemeChoice: "defQC1"
    }

    ExtFont {
        id: extFont_defQC2
        schemeChoice: "defQC2"
    }

    ExtFont {
        id: extFont_def
        schemeChoice: "def"
    }

    ExtFont {
        id: extFont_mistral
        schemeChoice: "mistral"
    }

    width: testGrid.width
    height: testGrid.height

    Grid {
        id: testGrid
        columns: 9
        spacing: 10

        Label { text: " " }
        Label { text: "1" }
        Label { text: "2" }
        Label { text: "3" }
        Label { text: "4" }
        Label { text: "5" }
        Label { text: "6" }
        Label { text: "7" }
        Label { text: "8" }

        Label { text: "bare Label" }
        Label { text: exampleText; }
        Label { text: exampleText; font.bold: true }
        Label { text: exampleText; font.italic: true }
        Label { text: exampleText; font.underline: true }
        Label { text: exampleText + " 8"; font.pointSize: 8 }
        Label { text: exampleText + " 12"; font.pointSize: 12 }
        Label { text: exampleText + " 24"; font.pointSize: 24 }
        Label { text: examplePlayground; font.pointSize: 12 }

        Text { text: "bare Text (compare, and don't use)" }
        Text { text: exampleText; }
        Text { text: exampleText; font.bold: true }
        Text { text: exampleText; font.italic: true }
        Text { text: exampleText; font.underline: true }
        Text { text: exampleText + " 8"; font.pointSize: 8 }
        Text { text: exampleText + " 12"; font.pointSize: 12 }
        Text { text: exampleText + " 24"; font.pointSize: 24 }
        Text { text: examplePlayground; font.pointSize: 12 }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_defQC1.schemeChoice; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_defQC2.schemeChoice; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_def.schemeChoice; font.italic: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_mistral.schemeChoice; font.italic: true } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_mistral.normal.family; text: examplePlayground; font.pointSize: 12 } }
    }
}
