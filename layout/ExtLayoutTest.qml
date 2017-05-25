import "impl"
import "../fonts"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


Window {
    width: 640//testGrid.width
    height: 480//testGrid.height

    ExtFont {
        id: extFont
        schemeChoice: "def"
    }
    ExtFontMetrics {
        id: extFontMetrics
    }
    ExtSpacing {
        id: extSpacing
    }

    Flickable {
        anchors.fill: parent
        contentWidth: contentItem.childrenRect.width
        contentHeight: contentItem.childrenRect.height
        clip: true

        ScrollBar.horizontal: ScrollBar {}
        ScrollBar.vertical: ScrollBar {}

        ColumnLayout {
            Slider {
                id: scaleSlider
                to: 10.0
                value: extSpacing.scaleFactor
                ToolTip {
                    parent: scaleSlider.handle
                    visible: scaleSlider.pressed
                    text: scaleSlider.valueAt(scaleSlider.position).toFixed(1)
                }
                onValueChanged: {
                    extSpacing.scaleFactor = value
                }
            }

            Grid {
                id: testGrid
                columns: 2
                spacing: 10


                Label { text: "charLikeMaxWidth" }
                TestRectangle { Row { spacing: extSpacing.charLikeMaxWidth; TestHelperObj {} TestHelperObj {} } }
                Label { text: "charLikeWidth" }
                TestRectangle { Row { spacing: extSpacing.charLikeWidth; TestHelperObj {} TestHelperObj {} } }
                Label { text: "charLikeHeight" }
                TestRectangle { Column { spacing: extSpacing.charLikeHeight; TestHelperObj {} TestHelperObj {} } }
                Label { text: "charxLikeHeight" }
                TestRectangle { Column { spacing: extSpacing.charxLikeHeight; TestHelperObj {} TestHelperObj {} } }

                Label { text: "pix1space" }
                TestRectangle { Row { spacing: extSpacing.pix1space; TestHelperObj {} TestHelperObj {} } }
                Label { text: "pix2space" }
                TestRectangle { Row { spacing: extSpacing.pix2space; TestHelperObj {} TestHelperObj {} } }

                Label { text: "space0" }
                TestRectangle { Row { spacing: extSpacing.space0; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space1" }
                TestRectangle { Row { spacing: extSpacing.space1; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space2" }
                TestRectangle { Row { spacing: extSpacing.space2; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space3" }
                TestRectangle { Row { spacing: extSpacing.space3; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space4" }
                TestRectangle { Row { spacing: extSpacing.space4; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space5" }
                TestRectangle { Row { spacing: extSpacing.space5; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space6" }
                TestRectangle { Row { spacing: extSpacing.space6; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space12" }
                TestRectangle { Row { spacing: extSpacing.space12; TestHelperObj {} TestHelperObj {} } }
                Label { text: "space24" }
                TestRectangle { Row { spacing: extSpacing.space24; TestHelperObj {} TestHelperObj {} } }

                Label { text: "pixTinyIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixTinyIconSq } }
                Label { text: "pixSmallIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixSmallIconSq } }
                Label { text: "pixMediumIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixMediumIconSq } }
                Label { text: "pixlargeIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixlargeIconSq } }
                Label { text: "pixLargeIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixLargeIconSq } }
                Label { text: "pixLARGEIconSq" }
                TestRectangle { TestHelperObj { a: extSpacing.pixLARGEIconSq } }
        //        Label { text: "pixhugeIconSq" }
        //        TestRectangle { TestHelperObj { a: extSpacing.pixhugeIconSq } }
        //        Label { text: "pixHugeIconSq" }
        //        TestRectangle { TestHelperObj { a: extSpacing.pixHugeIconSq } }
            }
        }
    }
}
