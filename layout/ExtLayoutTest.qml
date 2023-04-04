import "impl"
import "../_shared"
import "../colors_palette"
import "../controls/minimal"
import "../fonts"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


Item {
    id: root

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

    Component.onCompleted: {
        console.log("ExtLayoutTest diagnostic logs {")
        extScale.logScreenProps()
        extScale.logReferenceScreenAndScalingHints()
        console.log("}")
    }

    Flickable {
        anchors.fill: parent
        contentWidth: colLayout.childrenRect.width
        contentHeight: colLayout.childrenRect.height

        ScrollBar.horizontal: ScrollBar_ {}
        ScrollBar.vertical: ScrollBar_ {}

        ColumnLayout {
            id: colLayout
            spacing: extSpacing.pixLayoutSpacing

            CustomScaler {
            }

            Grid {
                id: propertyGrid
                columns: 2
                spacing: extSpacing.pixLayoutSpacing

                Label_ { text: "Screen name" }
                // under pure UWP the Screen's name doesn't seem to be defined
                Label_ { text: Screen.name ? Screen.name : "?" }

                Label_ { text: "dimensions" }
                Label_ { text: Screen.width + "x" + Screen.height }

                Label_ { text: "pixel density" }
                Label_ { text: extScale.ppi_phys.toFixed(2) + " pixels/inch (" + Screen.pixelDensity.toFixed(2) + " pixels/mm)" }

                Label_ { text: "logical pixel density" }
                Label_ { text: extScale.ppi.toFixed(2) + " pixels/inch (" + Screen.logicalPixelDensity.toFixed(2) + " pixels/mm)" }

                Label_ { text: "device pixel ratio" }
                Label_ { text: Screen.devicePixelRatio.toFixed(2) }

                Label_ { text: "available virtual desktop" }
                Label_ { text: Screen.desktopAvailableWidth + "x" + Screen.desktopAvailableHeight }

                Label_ { text: "orientation" }
                Label_ { text: extScale.orientationToString(Screen.orientation) + " (" + Screen.orientation + ")" }

                Label_ { text: "primary orientation" }
                Label_ { text: extScale.orientationToString(Screen.primaryOrientation) + " (" + Screen.primaryOrientation + ")" }

                Label_ { text: "window content dimensions" }
                Label_ { text: root.width + "x" + root.height }
            }

            Grid {
                id: testGrid
                columns: 2
                spacing: extSpacing.pixLayoutSpacing

                Label_ { text: "inch square (scaling logically)" }
                TestRectangle { TestHelperObj { a: extScale.in2p(1) } }

                Label_ { text: "inch square (non-scaling)" }
                TestRectangle { TestHelperObj { a: extScale.in2p_nonscaling(1) } }

                Label_ { text: "charLikeMaxWidth" }
                TestRectangle { Row { spacing: extSpacing.charLikeMaxWidth; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "charLikeWidth" }
                TestRectangle { Row { spacing: extSpacing.charLikeWidth; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "charLikeHeight" }
                TestRectangle { Column { spacing: extSpacing.charLikeHeight; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "charxLikeHeight" }
                TestRectangle { Column { spacing: extSpacing.charxLikeHeight; TestHelperObj {} TestHelperObj {} } }

                Label_ { text: "pix1space" }
                TestRectangle { Row { spacing: extSpacing.pix1space; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "pix2space" }
                TestRectangle { Row { spacing: extSpacing.pix2space; TestHelperObj {} TestHelperObj {} } }

                Label_ { text: "space0" }
                TestRectangle { Row { spacing: extSpacing.space0; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space1" }
                TestRectangle { Row { spacing: extSpacing.space1; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space2" }
                TestRectangle { Row { spacing: extSpacing.space2; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space3" }
                TestRectangle { Row { spacing: extSpacing.space3; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space4" }
                TestRectangle { Row { spacing: extSpacing.space4; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space5" }
                TestRectangle { Row { spacing: extSpacing.space5; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space6" }
                TestRectangle { Row { spacing: extSpacing.space6; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space12" }
                TestRectangle { Row { spacing: extSpacing.space12; TestHelperObj {} TestHelperObj {} } }
                Label_ { text: "space24" }
                TestRectangle { Row { spacing: extSpacing.space24; TestHelperObj {} TestHelperObj {} } }

                Label_ { text: "wTinyIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wTinyIconSq } }
                Label_ { text: "wSmallIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wSmallIconSq } }
                Label_ { text: "wMediumIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wMediumIconSq } }
                Label_ { text: "wlargeIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wlargeIconSq } }
                Label_ { text: "wLargeIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wLargeIconSq } }
                Label_ { text: "wLARGEIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.wLARGEIconSq } }
                //        Label_ { text: "whugeIconSq" }
                //        TestRectangle { TestHelperObj { a: extSpacing.whugeIconSq } }
                //        Label_ { text: "wHugeIconSq" }
                //        TestRectangle { TestHelperObj { a: extSpacing.wHugeIconSq } }
            } /// Grid
        } // ColumnLayout
    } // Flickable
} // Item
