import "../../colors_palette"
import "../../controls"
import "../../fonts"
import "../../layout"
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.2


ApplicationWindow {
    id: rootAppWindow

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

    ExtSpacing {
        id: extSpacing // don't change this specifier!
    }
 
    ExtControlsCfg {
        id: extControlsCfg // don't change this specifier!
    }

    visible: true

    width: 640
    height: 480
    
    ExtColorsTest {
    }

//    ControlsTest {
//    }
}
