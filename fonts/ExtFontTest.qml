import "impl"
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0 as QC2


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


    Component.onCompleted: {
        console.log("defQC1 family: ", extFont_defQC1.normal.family)
        console.log("defQC2 family: ", extFont_defQC2.normal.family)
        console.log("def family: ", extFont_def.normal.family)
        console.log("mistral family: ", extFont_mistral.normal.family)
    }

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

        Label { text: "bare QC1 Label" }
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

        QC2.Label { text: "bare QC2 Label (have to live with :/)" }
        QC2.Label { text: exampleText; }
        QC2.Label { text: exampleText; font.bold: true }
        QC2.Label { text: exampleText; font.italic: true }
        QC2.Label { text: exampleText; font.underline: true }
        QC2.Label { text: exampleText + " 8"; font.pointSize: 8 }
        QC2.Label { text: exampleText + " 12"; font.pointSize: 12 }
        QC2.Label { text: exampleText + " 24"; font.pointSize: 24 }
        QC2.Label { text: examplePlayground; font.pointSize: 12 }

        // It's tempting to use the better looking NativeRendering under Windows desktop.
        // But this is said to have bad transformation behavior, especially cross platform.
        QC2.Label { text: "QC2 Label NativeRendering"; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText; font.family: extFont_defQC1.normal.family; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText; font.bold: true; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText; font.italic: true; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText; font.underline: true; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText + " 9"; font.pointSize: 9; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText + " 12"; font.pointSize: 12; renderType: Text.NativeRendering }
        QC2.Label { text: exampleText + " 24"; font.pointSize: 24; renderType: Text.NativeRendering }
        QC2.Label { text: examplePlayground; font.pointSize: 12; renderType: Text.NativeRendering }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_defQC1.schemeChoice + " (QC1 Label)"; font.italic: true } }
        TestRectangle { Label { font: extFont_defQC1.normal; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_defQC1.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_defQC2.schemeChoice + " (QC1 Label)"; font.italic: true } }
        TestRectangle { Label { font: extFont_defQC2.normal; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_defQC2.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { Label { text: extFont_def.schemeChoice + " (QC1 Label)"; font.italic: true } }
        TestRectangle { Label { font: extFont_def.normal; text: exampleText; } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { Label { font.family: extFont_def.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { QC2.Label { text: extFont_def.schemeChoice + "(QC2 Label) <- POI"; font.italic: true } }
        TestRectangle { QC2.Label { font: extFont_def.normal; text: exampleText; } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { QC2.Label { font.family: extFont_def.normal.family; text: examplePlayground; font.pointSize: 12 } }


        //####################################################################################################################

        TestRectangle { QC2.Label { text: extFont_mistral.schemeChoice + " (QC2 Label)"; font.italic: true } }
        TestRectangle { QC2.Label { font: extFont_mistral.normal; text: exampleText; } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.bold: true } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.italic: true } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.underline: true } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 8 } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 12 } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: exampleText; font.pointSize: 24 } }
        TestRectangle { QC2.Label { font.family: extFont_mistral.normal.family; text: examplePlayground; font.pointSize: 12 } }
    }
}
