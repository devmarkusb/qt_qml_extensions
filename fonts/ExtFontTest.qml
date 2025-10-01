import "../colors_palette"
import "../controls/minimal"
import "../layout"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    readonly property string exampleText: "Hello World!"
    readonly property string examplePlayground: "012345679.:?!_oO0_1lL"

    ExtColors {
        id: extColors // don't change this specifier!
        schemeChoice: "bright"
    }

    ExtFont {
        id: extFont // don't change this specifier!
        schemeChoice: "def"
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

    ExtFontMetrics {
        id: extFontMetrics // don't change this specifier!
    }

    ExtScale {
        id: extScale // don't change this specifier!
    }

    ExtSpacing {
        id: extSpacing // don't change this specifier!
    }

    Component.onCompleted: {
        console.log("ExtFontTest diagnostic logs {")
        console.log("defQC2 family:", extFont_defQC2.normal.family, "pointSize:", extFont_defQC2.normal.pointSize, "pixelSize:", extFont_defQC2.normal.pixelSize)
        console.log("def family:", extFont_def.normal.family, "pointSize:", extFont_def.normal.pointSize, "pixelSize:", extFont_def.normal.pixelSize)
        console.log("mistral family:", extFont_mistral.normal.family, "pointSize:", extFont_mistral.normal.pointSize, "pixelSize:", extFont_mistral.normal.pixelSize)
        console.log("def font's metrics (used in extSpacing):")
        console.log("charLikeHeight =", extSpacing.charLikeHeight)
        console.log("charxLikeHeight =", extSpacing.charxLikeHeight)
        console.log("charLikeWidth =", extSpacing.charLikeWidth)
        console.log("charLikeMaxWidth =", extSpacing.charLikeMaxWidth)
        console.log("}")
    }

    Flickable {
        anchors.fill: parent
        contentWidth: contentItem.childrenRect.width
        contentHeight: contentItem.childrenRect.height

        ScrollBar.horizontal: ScrollBar_ {}
        ScrollBar.vertical: ScrollBar_ {}

        ColumnLayout {
            Grid {
                id: testGrid
                columns: 9
                spacing: extSpacing.pixLayoutSpacing

                Label { text: " " }
                Label { text: "1" }
                Label { text: "2" }
                Label { text: "3" }
                Label { text: "4" }
                Label { text: "5" }
                Label { text: "6" }
                Label { text: "7" }
                Label { text: "8" }

                Label { text: "bare Text (compare, and don't use)" }
                Text { text: exampleText; }
                Text { text: exampleText; font.bold: true }
                Text { text: exampleText; font.italic: true }
                Text { text: exampleText; font.underline: true }
                Text { text: exampleText + " 8"; font.pixelSize: extScale.point2p(8) }
                Text { text: exampleText + " 12"; font.pixelSize: extScale.point2p(12) }
                Text { text: exampleText + " 24"; font.pixelSize: extScale.point2p(24) }
                Text { text: examplePlayground; font.pixelSize: extScale.point2p(12) }

                Label { text: "bare QC2 Label" }
                Label { text: exampleText; }
                Label { text: exampleText; font.bold: true }
                Label { text: exampleText; font.italic: true }
                Label { text: exampleText; font.underline: true }
                Label { text: exampleText + " 8"; font.pixelSize: extScale.point2p(8) }
                Label { text: exampleText + " 12"; font.pixelSize: extScale.point2p(12) }
                Label { text: exampleText + " 24"; font.pixelSize: extScale.point2p(24) }
                Label { text: examplePlayground; font.pixelSize: extScale.point2p(12) }

                // It's tempting to use the better looking NativeRendering under Windows desktop.
                // But this is said to have bad transformation behavior, especially cross-platform.
                Label { text: "QC2 Label NativeRendering" }
                Label { text: exampleText; font.family: extFont_defQC2.normal.family; renderType: Text.NativeRendering }
                Label { text: exampleText; font.bold: true; renderType: Text.NativeRendering }
                Label { text: exampleText; font.italic: true; renderType: Text.NativeRendering }
                Label { text: exampleText; font.underline: true; renderType: Text.NativeRendering }
                Label { text: exampleText + " 8"; font.pixelSize: extScale.point2p(8); renderType: Text.NativeRendering }
                Label { text: exampleText + " 12"; font.pixelSize: extScale.point2p(12); renderType: Text.NativeRendering }
                Label { text: exampleText + " 24"; font.pixelSize: extScale.point2p(24); renderType: Text.NativeRendering }
                Label { text: examplePlayground; font.pixelSize: extScale.point2p(12); renderType: Text.NativeRendering }


                //####################################################################################################################

                Label { text: extFont_def.schemeChoice + " (minimal Label)"; font.italic: true }
                Label_ { font: extFont_def.normal; text: exampleText; }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.bold: true }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.italic: true }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.underline: true }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                Label_ { font.family: extFont_def.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }


                //####################################################################################################################

                Label { text: extFont_mistral.schemeChoice + " (minimal Label)"; font.italic: true }
                Label_ { font: extFont_mistral.normal; text: exampleText; }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.bold: true }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.italic: true }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.underline: true }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                Label_ { font.family: extFont_mistral.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }
            } // Grid
        } /// ColumnLayout
    } /// Flickable
} // Item
