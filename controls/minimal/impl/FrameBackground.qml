import "../../_shared/impl/obtainControlProps.js" as ControlProp


PaneBackground {
    border.width: extSpacing.wBorderWidth
    border.color: ControlProp.obtainBorderColor(control.enabled)
}
