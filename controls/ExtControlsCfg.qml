/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtControlsCfg {
        id: extControlsCfg // don't change this specifier!
    }
    \endcode
    Then you can refer to your global control config settings via e.g.
    extControlsCfg.tooltipsEnabled from everywhere below.
    Important: stick to the specifier 'extControlsCfg' as it is also used by the library itself.
*/
import QtQuick 2.7


QtObject {
    property bool tooltipsEnabled: true
    property int tooltipTimeout_ms: 2000
}