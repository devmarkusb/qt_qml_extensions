/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtFontMetrics {
        id: extFontMetrics // don't change this specifier!
    }
    \endcode
    Then you can refer to your global font metrics via extFontMetrics.<> from everywhere below.
    Important: stick to the specifier 'extFontMetrics' as it is also used by the library itself.
*/

import QtQuick 2.8


FontMetrics {
    font: extFont.normal
}
