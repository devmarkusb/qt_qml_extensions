#include "Toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_BEGIN"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_END"


int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    
//    engine.load(QUrl("qrc:/../../colors_palette/ExtColorsTest.qml"));
    engine.load(QUrl("qrc:/../../TestApp/gui/AppWindow.qml"));
    return app.exec();
}
