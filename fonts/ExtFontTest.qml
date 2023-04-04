import "../colors_palette"
import "../controls/QC1_def" as QC1_def
import "../controls/QC2_def" as QC2_def
import "../controls/minimal" as Min
import "../layout"
import QtQuick 2.8
import QtQuick.Controls 1.5 as QC1
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3


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
        console.log("defQC1 family:", extFont_defQC1.normal.family, "pointSize:", extFont_defQC1.normal.pointSize, "pixelSize:", extFont_defQC1.normal.pixelSize)
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

        ScrollBar.horizontal: Min.ScrollBar_ {}
        ScrollBar.vertical: Min.ScrollBar_ {}

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

                Label { text: "bare QC1 Label" }
                QC1.Label { text: exampleText; }
                QC1.Label { text: exampleText; font.bold: true }
                QC1.Label { text: exampleText; font.italic: true }
                QC1.Label { text: exampleText; font.underline: true }
                QC1.Label { text: exampleText + " 8"; font.pixelSize: extScale.point2p(8) }
                QC1.Label { text: exampleText + " 12"; font.pixelSize: extScale.point2p(12) }
                QC1.Label { text: exampleText + " 24"; font.pixelSize: extScale.point2p(24) }
                QC1.Label { text: examplePlayground; font.pixelSize: extScale.point2p(12) }

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
                // But this is said to have bad transformation behavior, especially cross platform.
                Label { text: "QC2 Label NativeRendering" }
                Label { text: exampleText; font.family: extFont_defQC1.normal.family; renderType: Text.NativeRendering }
                Label { text: exampleText; font.bold: true; renderType: Text.NativeRendering }
                Label { text: exampleText; font.italic: true; renderType: Text.NativeRendering }
                Label { text: exampleText; font.underline: true; renderType: Text.NativeRendering }
                Label { text: exampleText + " 8"; font.pixelSize: extScale.point2p(8); renderType: Text.NativeRendering }
                Label { text: exampleText + " 12"; font.pixelSize: extScale.point2p(12); renderType: Text.NativeRendering }
                Label { text: exampleText + " 24"; font.pixelSize: extScale.point2p(24); renderType: Text.NativeRendering }
                Label { text: examplePlayground; font.pixelSize: extScale.point2p(12); renderType: Text.NativeRendering }


                //####################################################################################################################

                Label { text: extFont_defQC1.schemeChoice + " (QC1 Label)"; font.italic: true }
                QC1_def.Label_ { font: extFont_defQC1.normal; text: exampleText; }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.bold: true }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.italic: true }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.underline: true }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                QC1_def.Label_ { font.family: extFont_defQC1.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }


                //####################################################################################################################

                Label { text: extFont_defQC2.schemeChoice + " (QC2_def Label)"; font.italic: true }
                QC2_def.Label_ { font: extFont_defQC2.normal; text: exampleText; }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.bold: true }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.italic: true }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.underline: true }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                QC2_def.Label_ { font.family: extFont_defQC2.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }


                //####################################################################################################################

                Label { text: extFont_def.schemeChoice + " (minimal Label)"; font.italic: true }
                Min.Label_ { font: extFont_def.normal; text: exampleText; }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.bold: true }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.italic: true }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.underline: true }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                Min.Label_ { font.family: extFont_def.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                Min.Label_ { font.family: extFont_def.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }


                //####################################################################################################################

                Label { text: extFont_mistral.schemeChoice + " (minimal Label)"; font.italic: true }
                Min.Label_ { font: extFont_mistral.normal; text: exampleText; }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.bold: true }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.italic: true }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.underline: true }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(8) }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(12) }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: exampleText; font.pixelSize: extScale.point2p(24) }
                Min.Label_ { font.family: extFont_mistral.normal.family; text: examplePlayground; font.pixelSize: extScale.point2p(12) }
            } // Grid

            Label {
                visible: Qt.platform.os === "winrt"
                text: "Warning: for the winrt platform the Quick Controls 1 (QC1) Label isn't supported (yet?!)"
                color: "red"
            }
        } /// ColumnLayout
    } /// Flickable
} // Item
