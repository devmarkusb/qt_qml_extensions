import "../../_shared/impl"
import "../../_shared/impl/obtainControlProps.js" as ControlProp


PaneBackground {
    CfgControls {
        id: cfgSingleton
    }

    border.width: extSpacing.wBorderWidth
    border.color: ControlProp.obtainBorderColor(control.enabled)
    radius: cfgSingleton.rCommonControlRadius
}
