/** Usage:
    Put the following code right somewhere in your root application item
    \code
    ExtScale {
        id: extScale // don't change this specifier!
    }
    \endcode
    Then you can refer to your global scaling toolbox via e.g. extScale.<...> from everywhere below.
    Important: stick to the specifier 'extScale' as it is also used by the library itself.
*/
import QtQuick
import QtQuick.Window


Item {
    //! Additional custom scale factor. Note, this multiplies to a possible automatic scaling by Qt that could be present also.
    property real factor: 1.0

    //! *Important* All the 'magic numbers' for pixel sizes used in the qml extension lib were (and must be) chosen judging the look
    //! on a reference screen with the following data.
    readonly property real refScreenWidth: 1920
    //! Cf. above.
    readonly property real refScreenHeight: 1080
    //! Cf. above.
    readonly property real refScreen_ppi: 96.0
    //! Cf. above.
    readonly property real refScreen_ppi_phys: 93.61458995237565

    //! This ratio r fulfils: screen length = r * ref. screen length.
    //! It can be used if you want a trivial omnipresent scaling according to screen size. Just set factor to this value.
    readonly property real ratio_Screen_RefScreen:
        Math.min(impl.screenShortSidelength * refScreen_ppi / (impl.refScreenShortSidelength * ppi), impl.screenLongSidelength * refScreen_ppi / (impl.refScreenLongSidelength * ppi));
    //! Analog to ratio_Screen_RefScreen but only considering pixels and ignoring ppi, so use with caution.
    readonly property real pixRatio_Screen_RefScreen: Math.min(impl.screenShortSidelength / impl.refScreenShortSidelength, impl.screenLongSidelength / impl.refScreenLongSidelength);

    readonly property real mm_per_inch: 25.4

    //! Returns logical ppi, which e.g. under Windows will contain the system scale factor (and grow along with it).
    readonly property real ppi: Screen.logicalPixelDensity * mm_per_inch
    readonly property real ppi_phys: Screen.pixelDensity * mm_per_inch

    readonly property bool isTabletSizeScreenOrLarger: Math.sqrt(Screen.width * Screen.width + Screen.height * Screen.height) / ppi > 5.3
    readonly property bool isPhoneSizeScreen: !isTabletSizeScreenOrLarger
    readonly property bool isPortraitOriented: Screen.orientation === Qt.PortraitOrientation

    //! Function set to obtain pixel sizes for input for x, y, width, height, etc., in a *scaling* manner.
    //!@{
    /** Note that (at least on the reference screen) in2p for 100% scaling doesn't yield the exact same result as in2p_nonscaling.
        in2p_nonscaling is better for larger values and in2p is better for smaller ones. Which of course mustn't be taken as a reason
        to choose one over the other. The nonscaling version will e.g. ignore the Windows scale factor, whereas the scaling version doesn't.
        Beyond that the scaling version also incorporates an additional custom scaling factor if present.*/
    function in2p(length) {
        return dp2p(length * refScreen_ppi);
    }

    //! Cf. in2p.
    function mm2p(length) {
        return in2p(length / mm_per_inch);
    }

    //! Cf. in2p. Expects the pixel count for a 96ppi reference screen.
    function dp2p(pixels_for_96ppi) {
        return custom_scaled(pixels_for_96ppi) * ppi / refScreen_ppi;
    }

    //! Cf. in2p.
    function in2p_nonscaling(length) {
        return dp2p_nonscaling(length * refScreen_ppi);
    }

    //! Cf. in2p.
    function mm2p_nonscaling(length) {
        return in2p_nonscaling(length / mm_per_inch);
    }

    //! Cf. dp2p.
    function dp2p_nonscaling(pixels_for_96ppi) {
        // ppi_phys deviates from 96.0 for our ref screen. But we don't want to force the caller
        // to use some strange number different from 96.0 if he wants 1 in. That's why we implemented
        // an additional calculation step. More understandably the following calculation equals
        // pixels_for_ref_ppi_phys * ppi_phys / refScreen_ppi_phys.
        return pixels_for_96ppi * ppi_phys * ppi_phys / refScreen_ppi_phys / refScreen_ppi;
    }
    //!@}

    //! Point sizes are likely to yield different pixel sizes on various platforms.
    //! So far I assume that all agree to understand a point as 1/72 of an inch. Nevertheless, using
    //! this function whenever dealing with point sizes will limit to one place to change in case.
    //! Note that you get a scaling (also custom) result, just as you expect when using points.
    function point2p(pointSize) {
        return Math.round(custom_scaled(pointSize) * ppi / 72.0);
    }

    //! Applies factor to value.
    function custom_scaled(value) {
        return value * factor;
    }

    function orientationToString(o) {
        switch (o) {
        case Qt.PrimaryOrientation:
            return "primary";
        case Qt.PortraitOrientation:
            return "portrait";
        case Qt.LandscapeOrientation:
            return "landscape";
        case Qt.InvertedPortraitOrientation:
            return "inverted portrait";
        case Qt.InvertedLandscapeOrientation:
            return "inverted landscape";
        }
        return "unknown";
    }

    function logScreenProps() {
        console.log("screen name:", Screen.name);
        console.log("dimensions:", Screen.width, "x", Screen.height);
        console.log("ppi:", ppi);
        console.log("ppi (physical):", ppi_phys);
        console.log("device pixel ratio:", Screen.devicePixelRatio);
        console.log("available virtual desktop:", Screen.desktopAvailableWidth, "x", Screen.desktopAvailableHeight);
        console.log("orientation:", orientationToString(Screen.orientation), "(", Screen.orientation, ")");
        console.log("primary orientation:", orientationToString(Screen.primaryOrientation), "(", Screen.primaryOrientation, ")");
    }

    function logReferenceScreenAndScalingHints() {
        console.log("reference screen dimensions:", refScreenWidth, "x", refScreenHeight, "with ppi:", refScreen_ppi);
        console.log("screen dimensions:", Screen.width, "x", Screen.height, "with ppi:", ppi);
        console.log("scaling ratio r (fulfilling: screen length = r * ref. screen length):", ratio_Screen_RefScreen);
    }


    QtObject {
        id: impl
        readonly property real refScreenLongSidelength: Math.max(refScreenWidth, refScreenHeight)
        readonly property real refScreenShortSidelength: Math.min(refScreenWidth, refScreenHeight)
        readonly property real screenLongSidelength: Math.max(Screen.width, Screen.height)
        readonly property real screenShortSidelength: Math.min(Screen.width, Screen.height)
    }
}
