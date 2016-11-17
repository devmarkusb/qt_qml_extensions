import "minimal"
import "../colors_palette"
import "../fonts"
import "../layout"
import "../os"
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: root


    width: 1200
    height: 800
    visible: true

    ExtOS {
        id: extOS
        os: "WINDOWS"
    }

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

    Component.onCompleted: {
    }

    Grid {
        columns: 3
        spacing: extSpacing.pix2space
        padding: spacing

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
            Column {
                spacing: extSpacing.space3
                TextFieldLabelRow_ {
                    placeholderText: "0"
                    text: "some text"
                    inputWidthInChars: 10
                }
                TextFieldLabelRow_ {
                    placeholderText: "0"
                    text: "some text"
                    inputWidthInChars: 10
                    enabled: false
                }
            }
        }

        TestHelperBox {
            id: tabview
            title: "TabView_"
            Column {
                TabBar_ {
                    id: tabcontrol
                    width: tabview.width - 20
                    TabButton_ {
                        text: "tab red"
                    }
                    TabButton_ {
                        text: "tab green"
                    }
                    TabButton_ {
                        text: "tab blue"
                    }
                }
                StackLayout {
                    currentIndex: tabcontrol.currentIndex
                    width: tabcontrol.width
                    Rectangle {
                        color: "red"
                        height: 50
                    }
                    Rectangle {
                        color: "green"
                    }
                    Rectangle {
                        color: "blue"
                    }
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "TabView_ (disabled)"
            Column {
                TabBar_ {
                    id: tabcontrol_dis
                    enabled: false
                    TabButton_ {
                        text: "tab red"
                    }
                    TabButton_ {
                        text: "tab green"
                    }
                    TabButton_ {
                        text: "tab blue"
                    }
                }
                StackLayout {
                    currentIndex: tabcontrol_dis.currentIndex
                    Rectangle {
                        color: "red"
                        width: 30
                        height: 30
                    }
                    Rectangle {
                        color: "green"
                        width: 30
                        height: 30
                    }
                    Rectangle {
                        color: "blue"
                        width: 30
                        height: 30
                    }
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "Button_"
            Column {
                spacing: extSpacing.space3
                Button_ {
                    text: "Press me"
                }
                Button_ {
                    text: "Press me"
                    enabled: false
                }
                Button_ {
                    text: "Button with a lot of text - grows automatically :)"
                }
            }
        }

        TestHelperBox {
            title: "Button_ (isSpecial: true)"
            Column {
                spacing: extSpacing.space3
                Button_ {
                    isSpecial: true
                    text: "Press me"
                }
                Button_ {
                    isSpecial: true
                    text: "Press me"
                    enabled: false
                }
            }
        }

        TestHelperBox {
            title: "ButtonSq_"
            Row {
                spacing: extSpacing.space3
                ButtonSq_ {
                    imageSource: "buttonsq_menu.svg"
                    squareSideLength: extSpacing.pixlargeIconSq
                }
                ButtonSq_ {
                    imageSource: "buttonsq_menu.svg"
                    squareSideLength: extSpacing.pixlargeIconSq
                    enabled: false
                }

                ButtonSq_ {
                    isSpecial: true
                    imageSource: "buttonsq_menu.svg"
                    squareSideLength: extSpacing.pixlargeIconSq
                }
                ButtonSq_ {
                    isSpecial: true
                    imageSource: "buttonsq_menu.svg"
                    squareSideLength: extSpacing.pixlargeIconSq
                    enabled: false
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "ButtonWithIcon_"
            Row {
                spacing: extSpacing.space3
                Column {
                    spacing: extSpacing.space3
                    ButtonWithIcon_ {
                        imageSource: "spheres.svg"
                        text: "Press me"
                    }
                    ButtonWithIcon_ {
                        imageSource: "spheres.svg"
                        text: "Press me"
                        enabled: false
                    }
                }

                Column {
                    spacing: extSpacing.space3
                    ButtonWithIcon_ {
                        isSpecial: true
                        imageSource: "spheres.svg"
                        text: "Press me"
                    }
                    ButtonWithIcon_ {
                        isSpecial: true
                        imageSource: "spheres.svg"
                        text: "Press me"
                        enabled: false
                    }
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "Pane_"
            Pane_ {
                anchors.fill: parent

                Rectangle {
                    color: "black"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    width: 10
                    height: width
                }
                Label_ {
                    text: "squares are just marking the content corners"
                    anchors.centerIn: parent
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "Item (for comparison)"
            Item {
                anchors.fill: parent

                Rectangle {
                    color: "black"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: 10
                    height: width
                }
                Rectangle {
                    color: "black"
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    width: 10
                    height: width
                }
                Label_ {
                    text: "squares are just marking the content corners"
                    anchors.centerIn: parent
                }
            }
        } // TestHelperBox

        TestHelperBox {
            title: "CharColorSwitch_"
            CharColorSwitch_ {
                offChar: qsTr("-")
                onChar: qsTr("+")
                offColor: "red"
                onColor: "green"
                charColor: "white"
                charYcorr: -2
            }
        }
    } // Grid
}
