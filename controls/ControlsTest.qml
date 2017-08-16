import "minimal"
import "../_shared"
import "../colors_palette"
import "../fonts"
import "../layout"
import QtQuick 2.8
import QtQuick.Controls 1.5 as QC1
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3


Item {
    id: root

    width: extSpacing.twoThirdAvailableAppWidth
    height: extSpacing.twoThirdAvailableAppHeight

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

    ExtControlsCfg {
        id: extControlsCfg // don't change this specifier!
    }

    Component.onCompleted: {
    }

    Flickable {
        anchors.fill: parent
        contentWidth: contentItem.childrenRect.width
        contentHeight: contentItem.childrenRect.height
        clip: true

        ScrollBar.horizontal: ScrollBar_ {}
        ScrollBar.vertical: ScrollBar_ {}

        ColumnLayout {
            spacing: extSpacing.pixLayoutSpacing

            CustomScaler {
            }

            Grid {
                columns: 5
                spacing: extSpacing.pixLayoutSpacingX2
                padding: spacing
                Layout.topMargin: extSpacing.charLikeHeight

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
                        anchors.fill: parent
                        spacing: extSpacing.space3
                        TextField_ {
                            placeholderText: "placeholderText"
                        }
                        TextField_ {
                            id: disabledTextField
                            placeholderText: "placeholderText"
                            text: "disabled real text with selected last word"
                            width: parent.width
                            enabled: false
                            Component.onCompleted: {
                                disabledTextField.selectWord();
                            }
                        }
                        TextField_ {
                            enabled: false
                            width: parent.width
                            placeholderText: "disabled placeholderText"
                        }
                    }
                }

                TestHelperBox {
                    title: "TextFieldWithLabel_"
                    Row {
                        spacing: extSpacing.space3
                        Column {
                            spacing: extSpacing.space3
                            TextFieldWithLabel_ {
                                placeholderText: "0"
                                title: "some text"
                                inputWidthInChars: 10
                            }
                            TextFieldWithLabel_ {
                                placeholderText: "0"
                                title: "some text"
                                inputWidthInChars: 10
                                enabled: false
                            }
                            TextFieldWithLabel_ {
                                placeholderText: "0"
                                title: "some text"
                                inputWidthInChars: 10
                                labelPos: "left"
                            }
                        } // Column

                        TextFieldWithLabel_ {
                            placeholderText: "0"
                            title: "some text"
                            inputWidthInChars: 20
                            labelPos: "top"
                        }
                    } // Row
                } // TestHelperBox

                // Note, for QC1 comment out the following two
                TestHelperBox {
                    id: tabview
                    title: "TabView_/TabBar_"
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: extSpacing.pix0space

                        TabBar_ {
                            id: tabcontrol

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
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle {
                                color: "red"
                            }
                            Rectangle {
                                color: "green"
                            }
                            Rectangle {
                                color: "blue"
                            }
                        }
                    } // ColumnLayout
                } // TestHelperBox

                TestHelperBox {
                    title: "TabView_/TabBar_ (disabled)"
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: extSpacing.pix0space

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
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle {
                                color: "red"
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

                // Note, for QC2 comment out the following two
                // TestHelperBox {
                //     id: tabview
                //     title: "TabView_/TabBar_"
                //     TabView_ {
                //         anchors.fill: parent
                //         Tab {
                //             title: "tab red"
                //             Rectangle {
                //                 color: "red"
                //                 height: 50
                //             }
                //         }
                //         Tab {
                //             title: "tab green"
                //             Rectangle {
                //                 color: "green"
                //             }
                //         }
                //         Tab {
                //             title: "tab blue"
                //             Rectangle {
                //                 color: "blue"
                //             }
                //         }
                //     }
                // } // TestHelperBox

                // TestHelperBox {
                //     title: "TabView_/TabBar_ (disabled)"
                //     TabView_ {
                //         enabled: false
                //         anchors.fill: parent
                //         Tab {
                //             title: "tab red"
                //             Rectangle {
                //                 color: "red"
                //                 height: 50
                //             }
                //         }
                //         Tab {
                //             title: "tab green"
                //             Rectangle {
                //                 color: "green"
                //             }
                //         }
                //         Tab {
                //             title: "tab blue"
                //             Rectangle {
                //                 color: "blue"
                //             }
                //         }
                //     }
                // } // TestHelperBox

                TestHelperBox {
                    title: "Button_"
                    Column {
                        spacing: extSpacing.space3
                        Row {
                            spacing: extSpacing.space3
                            Button_ {
                                text: "Press me"
                            }
                            Button_ {
                                text: "Press me"
                                enabled: false
                            }
                        }
                        Button_ {
                            text: "Button with lots text - grows automatically"
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
                    title: "ButtonTool_"
                    Row {
                        spacing: extSpacing.space3
                        ButtonTool_ {
                            imageSource: "menu.svg"
                            squareSideLength: extSpacing.wlargeIconSq
                        }
                        ButtonTool_ {
                            imageSource: "menu.svg"
                            squareSideLength: extSpacing.wlargeIconSq
                            enabled: false
                        }

                        ButtonTool_ {
                            isSpecial: true
                            imageSource: "menu.svg"
                            squareSideLength: extSpacing.wlargeIconSq
                        }
                        ButtonTool_ {
                            isSpecial: true
                            imageSource: "menu.svg"
                            squareSideLength: extSpacing.wlargeIconSq
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

                        TestHelperCornerMarkers {
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "Item (for comparison)"
                    Item {
                        anchors.fill: parent

                        TestHelperCornerMarkers {
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "CharColorSwitch_"
                    Column {
                        spacing: extSpacing.space3
                        CharColorSwitch_ {
                            offChar: qsTr("-")
                            onChar: qsTr("+")
                            offColor: "red"
                            onColor: "green"
                            charColor: "white"
                            charYcorr: -2
                        }
                        Row {
                            spacing: extSpacing.space3
                            CharColorSwitch_ {
                                enabled: false
                                checked: false
                                offChar: qsTr("-")
                                onChar: qsTr("+")
                                offColor: "red"
                                onColor: "green"
                                charColor: "white"
                                charYcorr: -2
                            }
                            CharColorSwitch_ {
                                enabled: false
                                checked: true
                                offChar: qsTr("-")
                                onChar: qsTr("+")
                                offColor: "red"
                                onColor: "green"
                                charColor: "white"
                                charYcorr: -2
                            }
                            Label_ {
                                text: "(both disabled ones)"
                            }
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    id: groupBoxes
                    title: "GroupBox_"
                    RowLayout {
                        anchors.fill: parent
                        spacing: extSpacing.pixLayoutSpacingX2
                        GroupBox_ {
                            title: "A group box"
                            Layout.topMargin: extSpacing.charLikeHeight
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                        GroupBox_ {
                            enabled: false
                            title: "A disabled group box"
                            Layout.topMargin: extSpacing.charLikeHeight
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                    }
                }

                TestHelperBox {
                    title: "RadioButton_"
                    Row {
                        spacing: extSpacing.space3
                        Column {
                            RadioButton_ {
                                text: "Excl. Option 1"
                            }
                            RadioButton_ {
                                text: "Excl. Option 2"
                            }
                        }
                        Column {
                            RadioButton_ {
                                text: "Excl. Option 1"
                                checked: true
                                enabled: false
                            }
                            RadioButton_ {
                                text: "Excl. Option 2"
                                enabled: false
                            }
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "CheckBox_"
                    Row {
                        spacing: extSpacing.space3
                        Column {
                            CheckBox_ {
                                text: "Option 1"
                            }
                            CheckBox_ {
                                text: "Option 2"
                            }
                        }
                        Column {
                            CheckBox_ {
                                text: "Option 1"
                                checked: true
                                enabled: false
                            }
                            CheckBox_ {
                                text: "Option 2"
                                enabled: false
                            }
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "SpinBox_"
                    Column {
                        spacing: extSpacing.space3
                        SpinBox_ {
                            to: 10
                            value: 10
                        }
                        SpinBox_ {
                            enabled: false
                        }
                    }
                }

                TestHelperBox {
                    title: "SpinBoxLabelRow_"
                    Column {
                        spacing: extSpacing.space3
                        SpinBoxLabelRow_ {
                            text: "Text label here"
                            value: 42
                        }
                        SpinBoxLabelRow_ {
                            text: "Text label here"
                            value: 42
                            enabled: false
                        }
                    }
                }

                TestHelperBox {
                    title: "Dialogs"
                    Grid {
                        columns: 2
                        spacing: extSpacing.space3
                        Button_ {
                            text: "Popup_"

                            onClicked: {
                                popup.open()
                            }
                        }

                        Button_ {
                            text: "Drawer_"

                            onClicked: {
                                drawer.open()
                            }
                        }

                        Button_ {
                            id: openFileBtn
                            text: "FileDialog"
                            horizontalTextAlignment: Text.AlignLeft

                            onClicked: {
                                fileDialog.open()
                            }
                            ShortcutLabel_ {
                                basecontrol: openFileBtn
                                sequence: StandardKey.Open
                                text: nativeText
                                onActivated: openFileBtn.onClicked()
                            }
                        }
                    }
                } // TestHelperBox

                // Note, custom scaling doesn't work here. But let's ignore that for now
                // as this flickable is an academic construction anyway.
                TestHelperBox {
                    title: "Flickable with ScrollBar_'s"
                    Flickable {
                        anchors.fill: parent
                        contentWidth: width * 1.5
                        contentHeight: height * 1.5

                        ScrollBar.vertical: ScrollBar_ {}
                        ScrollBar.horizontal: ScrollBar_ {}
                    }
                }

                // Cf. comment on the enabled version above.
                TestHelperBox {
                    title: "Flickable with ScrollBar_'s (disabled)"
                    Flickable {
                        anchors.fill: parent
                        contentWidth: width * 1.5
                        contentHeight: height * 1.5

                        enabled: false

                        ScrollBar.vertical: ScrollBar_ {}
                        ScrollBar.horizontal: ScrollBar_ {}
                    }
                }

                TestHelperBox {
                    title: "ComboBox_"
                    Column {
                        spacing: extSpacing.space3
                        ComboBox_ {
                            model: ["First", "Second", "Third"]
                        }
                        ComboBox_ {
                            enabled: false
                            model: ["First", "Second", "Third"]
                        }
                    }
                }

                TestHelperBox {
                    title: "ListBox_"
                    Row {
                        anchors.fill: parent
                        spacing: extSpacing.space3
                        ListBox_ {
                            width: parent.width / 2.5
                            //height: parent.height
                            listmodel: ListModel {
                                ListElement {
                                    text: "First"
                                }
                                ListElement {
                                    text: "Second"
                                }
                                ListElement {
                                    text: "Third"
                                }
                                ListElement {
                                    text: "Fourth"
                                }
                            }
                        } // ListBox_
                        ListBox_ {
                            enabled: false
                            width: parent.width / 2.5
                            //height: parent.height
                            listmodel: ListModel {
                                ListElement {
                                    text: "First"
                                }
                                ListElement {
                                    text: "Second"
                                }
                                ListElement {
                                    text: "Third"
                                }
                                ListElement {
                                    text: "Fourth"
                                }
                            }
                        } // ListBox_
                    } // Row
                } // TestHelperBox

                TestHelperBox {
                    title: "ToolTip_"
                    Rectangle {
                        property alias hovered: tooltipRectMA.containsMouse
                        color: "yellow"
                        width: 50 * extSpacing.charLikeWidth
                        height: 4 * extSpacing.charLikeHeight
                        anchors.centerIn: parent
                        Label_ {
                            anchors.centerIn: parent
                            text: "Please move your mouse here.\nNote, that I have a 'hovered' property."
                            color: "black"
                        }
                        MouseArea {
                            id: tooltipRectMA
                            anchors.fill: parent
                            hoverEnabled: true
                        }

                        ToolTip_ {
                            text: "Other than that, I'm just a yellow rectangle :)"
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "alternateBase color"
                    Row {
                        anchors.fill: parent
                        Rectangle {
                            color: extColors.activeC.base
                            height: parent.height
                            width: parent.width / 2
                            Label_ {
                                anchors.centerIn: parent
                                text: "base active"
                            }
                        }
                        Rectangle {
                            color: extColors.activeC.alternateBase
                            height: parent.height
                            width: parent.width / 2
                            Label_ {
                                anchors.centerIn: parent
                                text: "altBase active"
                            }
                        }
                    }
                } // TestHelperBox

                TestHelperBox {
                    title: "TextArea_"
                    Flickable {
                        anchors.fill: parent
                        clip: true
                        ScrollBar.vertical: ScrollBar_ {}
                        ScrollBar.horizontal: ScrollBar_ {}
                        TextArea.flickable: TextArea_ {
                            anchors.fill: parent
                            wrapMode: TextArea.Wrap
                            selectByMouse: true
                            text: "some text...\non multiple lines\na... wrap wrap wrap wrap wrap wrap wrap wrap wrap wrapwrap wrap wrap wrap\nb...\n\nc...\nd\ne\nf\ng"
                        }
                    }
                } // TestHelperBox
            } // Grid


            Popup_ {
                id: popup
                width: root.width * 0.75
                height: root.height * 0.75
                x: (root.width - width) / 2
                y: (root.height - height) / 2

                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            }

            Drawer_ {
                id: drawer
                width: root.width * 0.25
                height: root.height
            }

            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                folder: shortcuts.home

                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrls)
                }

                onRejected: {
                    console.log("Canceled")
                }
            } // Grid
        } // ColumnLayout
    } // Flickable
} // Item
