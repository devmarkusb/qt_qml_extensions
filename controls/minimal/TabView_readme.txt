QtQuick.Controls 2.x don't have TabView_ + Tab

The code conversion is done like sketched below.

    Column {
        TabBar_ {
            id: tabcontrol
            position: TabBar.Header
            TabButton_ {
                text: "tab 1"
            }
            TabButton_ {
                text: "tab 2"
            }
        }
        StackLayout {
            currentIndex: tabcontrol.currentIndex
            width: root.width
            height: root.height
            Tab1Item {
            }
            Tab2Item {
            }
        }
    }

<--->
       
    TabView_ {
        anchors.fill: parent
        tabPosition: Qt.TopEdge
        Tab {
            title: "tab 1"
            Tab1Item {
            }
        }
        Tab {
            title: "tab 2"
            Tab2Item {
            }
        }
    }
