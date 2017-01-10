import "minimal"
import "../colors_palette"
import "../fonts"
import "../layout"
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2


ApplicationWindow_ {
    id: root


    width: 1600
    height: 600
    visible: true

    ExtColors {
        id: extColors // don't change this specifier!
        schemeChoice: "def"
        //schemeChoice: "purpleGreen"
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

    Flickable {
        anchors.fill: parent
        contentWidth: contentItem.childrenRect.width
        contentHeight: contentItem.childrenRect.height
        clip: true

        ScrollBar.horizontal: ScrollBar_ {}
        ScrollBar.vertical: ScrollBar_ {}
        Grid {
            columns: 5
            spacing: extSpacing.space6
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
                        id: disabledTextField
                        placeholderText: "placeholderText"
                        text: "disabled real text with selected last word"
                        width: 250
                        enabled: false
                        Component.onCompleted: {
                            disabledTextField.selectWord();
                        }
                    }
                    TextField_ {
                        enabled: false
                        width: 250
                        placeholderText: "disabled placeholderText"
                    }
                }
            }

            TestHelperBox {
                title: "TextFieldLabelRow_"
                Column {
                    spacing: extSpacing.space3
                    TextFieldLabelRow_ {
                        placeholderText: "0"
                        title: "some text"
                        inputWidthInChars: 10
                    }
                    TextFieldLabelRow_ {
                        placeholderText: "0"
                        title: "some text"
                        inputWidthInChars: 10
                        enabled: false
                    }
                }
            }

            // Note, for QC1 comment out the following two
            TestHelperBox {
                id: tabview
                title: "TabView_/TabBar_"
                Column {
                    anchors.fill: parent

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
                        anchors.left: parent.left
                        anchors.right: parent.right
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
                title: "TabView_/TabBar_ (disabled)"
                Column {
                    anchors.fill: parent

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
                        anchors.left: parent.left
                        anchors.right: parent.right
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

            //        // Note, for QC2 comment out the following two
            //        TestHelperBox {
            //            id: tabview
            //            title: "TabView_/TabBar_"
            //            TabView_ {
            //                anchors.fill: parent
            //                Tab {
            //                    title: "tab red"
            //                    Rectangle {
            //                        color: "red"
            //                        height: 50
            //                    }
            //                }
            //                Tab {
            //                    title: "tab green"
            //                    Rectangle {
            //                        color: "green"
            //                    }
            //                }
            //                Tab {
            //                    title: "tab blue"
            //                    Rectangle {
            //                        color: "blue"
            //                    }
            //                }
            //            }
            //        } // TestHelperBox

            //        TestHelperBox {
            //            title: "TabView_/TabBar_ (disabled)"
            //            TabView_ {
            //                enabled: false
            //                anchors.fill: parent
            //                Tab {
            //                    title: "tab red"
            //                    Rectangle {
            //                        color: "red"
            //                        height: 50
            //                    }
            //                }
            //                Tab {
            //                    title: "tab green"
            //                    Rectangle {
            //                        color: "green"
            //                    }
            //                }
            //                Tab {
            //                    title: "tab blue"
            //                    Rectangle {
            //                        color: "blue"
            //                    }
            //                }
            //            }
            //        } // TestHelperBox

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
                title: "ButtonTool_"
                Row {
                    spacing: extSpacing.space3
                    ButtonTool_ {
                        imageSource: "menu.svg"
                        squareSideLength: extSpacing.pixlargeIconSq
                    }
                    ButtonTool_ {
                        imageSource: "menu.svg"
                        squareSideLength: extSpacing.pixlargeIconSq
                        enabled: false
                    }

                    ButtonTool_ {
                        isSpecial: true
                        imageSource: "menu.svg"
                        squareSideLength: extSpacing.pixlargeIconSq
                    }
                    ButtonTool_ {
                        isSpecial: true
                        imageSource: "menu.svg"
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
                title: "GroupBox_"
                Row {
                    topPadding: 5
                    spacing: extSpacing.space3
                    GroupBox_ {
                        title: "A group box"
                        width: 140
                        height: 80
                    }
                    GroupBox_ {
                        enabled: false
                        title: "A disabled group box"
                        width: 140
                        height: 80
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
                        text: "FileDialog"

                        onClicked: {
                            fileDialog.open()
                        }
                    }
                }
            } // TestHelperBox

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

            TestHelperBox {
                title: "Flickable with ScrollBar_'s (disbled)"
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
                    }
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
                    }
                }
            }
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
    } // Flickable
} // ApplicationWindow
