function get_platform() {
    return Qt.platform.os;
}

function is_mobile() {
    return get_platform() === "android" || get_platform() === "ios";
}
