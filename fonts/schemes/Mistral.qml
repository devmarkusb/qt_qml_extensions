import QtQuick
import QtQuick.Controls


Text {
    id: root

    readonly property string requestedFamily: "Mistral"
    readonly property var fallbackFamilies: [
        Qt.application.font.family,
        "Segoe UI",
        "Helvetica Neue",
        "Helvetica",
        "Arial",
        "DejaVu Sans",
        "Noto Sans"
    ]

    QtObject {
        id: impl

        readonly property string resolvedFamily: resolveFamily()

        function resolveFamily() {
            var availableFamilies = Qt.fontFamilies();
            if (availableFamilies.indexOf(root.requestedFamily) !== -1) {
                return root.requestedFamily;
            }

            for (var i = 0; i < root.fallbackFamilies.length; ++i) {
                if (availableFamilies.indexOf(root.fallbackFamilies[i]) !== -1) {
                    return root.fallbackFamilies[i];
                }
            }

            return availableFamilies.length > 0 ? availableFamilies[0] : "";
        }
    }

    Binding on font.family {
        when: impl.resolvedFamily !== ""
        value: impl.resolvedFamily
    }
}
