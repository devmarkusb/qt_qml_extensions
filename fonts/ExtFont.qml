/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtFont {
        id: extFont // don't change this specifier!
        schemeChoice: "def"
    }
    \endcode
    Then you can refer to your global font choice via e.g. extFont.normal from everywhere below.
    The schemeChoice can be chosen to you liking.
    Important: stick to the specifier 'extFont' as it is also used by the library itself.
*/

import "schemes"
import QtQuick 2.8


Item {
    property string schemeChoice: "def" // choose one from scheme subfolder with lowercase first letter
    property alias normal: text.font

    function convert2properPixelSize(pointSize) {
        return extScale.custom_scaled(extScale.point2p(pointSize));
    }

    Text {
        id: text
        state: schemeChoice

        DefQC1 {
            id: defqc1Singleton
        }
        DefQC2 {
            id: defqc2Singleton
        }
        Def {
            id: defSingleton
        }
        Mistral {
            id: mistralSingleton
        }

        states: [
            State {
                name: "defQC1"
                PropertyChanges {
                    target: text
                    font: defqc1Singleton.font
                }
            },
            State {
                name: "defQC2"
                PropertyChanges {
                    target: text
                    font: defqc2Singleton.font
                }
            },
            State {
                name: "def"
                PropertyChanges {
                    target: text
                    font: defSingleton.font
                }
            },
            State {
                name: "mistral"
                PropertyChanges {
                    target: text
                    font: mistralSingleton.font
                }
            }
        ] // states
    }
}
