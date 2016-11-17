import QtQuick.Controls 2.0


/** In documentation they talk about a Label item to be customized. At least until 2.0 this seems
    to be nonsense. We can/must set text properties, especially font, directly.
    Major issue: we cannot set the render type. All in all GroupBox with text is a pain in the ass.
    
    Alternatives:
        * Just use this GroupBox_ *without* text, and put the text
            within or outside the GroupBox_ (e.g. by ColumnLayout).
        * Try to get the custom-styled GroupBoxQC1Styled_.qml working (could be time-consuming
            or even impossible - why didn't Qt provide that stuff?)*/
GroupBox {
    padding: extSpacing.space1
    font: extFont.normal
}
