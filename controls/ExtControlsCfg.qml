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
import "../core/os.js" as OS
import QtQuick


QtObject {
    property bool tooltipsEnabled: OS.is_mobile() ? false : true
    property int tooltipTimeout_ms: 2000
    property real flickDefaultVelocity: 500
    property real flickFastVelocity: flickDefaultVelocity * 2

    readonly property int invalidIdx: -1

    readonly property bool shortcutAcceptsStandardKeysOnly: OS.get_platform() === "winrt" ? true : false
}
