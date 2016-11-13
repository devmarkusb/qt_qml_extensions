1 Quick Guide

    1 Put the following directly under your app root item
        \code
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
        \endcode
        ... and be happy.
        You will also need to include
        \code
        import "../qt_qml_extensions/colors_palette"
        import "../qt_qml_extensions/fonts"
        import "../qt_qml_extensions/layout"
        \endcode
        
