/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtOS {
        id: extOS // don't change this specifier!
        os: "WINDOWS"
    }
    \endcode
    Then you and the library can refer to your global OS choice via extOS.os from everywhere below.
    The os schould be set by the app's C++ code.
    Important: stick to the specifier 'os' as it is also used by the library itself.
*/

import QtQuick 2.7


QtObject {
    //! Possible choices are WINDOWS, LINUX, MAC, FREEBSD, ANDROID
    property string os: "WINDOWS"
}
