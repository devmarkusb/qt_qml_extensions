//! Recommended usage:
/**
        ColumnLayout {
            spacing: extSpacing.pix0space
            TabBar_ {
                id: tabcontrol
                TabButton_ {
                }
                TabButton_ {
                }
            }
            StackLayout {
                currentIndex: tabcontrol.currentIndex
                Layout.fillWidth: true
                Layout.fillHeight: true
                Item {
                }
                Item {
                }
            }
*/
import "../_shared/impl"
import "../QC2_def" as QC2
import QtQuick 2.8
import QtQuick.Controls 2.2


QC2.TabBar_ {
    CfgControls {
        id: cfgSingleton
    }

    implicitHeight: cfgSingleton.hButtonHeight

    opacity: 1.0

    background: Rectangle {
        color: extColors.activeC.window
        radius: cfgSingleton.rCommonControlRadius
    }
}
