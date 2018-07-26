#include "cfg_model.h"
#include "toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_BEGIN"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_END"
#include <memory>


int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    auto root_context = engine.rootContext();

    CfgModel cfg_model;
    root_context->setContextProperty(QStringLiteral("cfgModel"), &cfg_model);

    engine.load(QUrl("qrc:/TestApp/gui/AppWindow.qml"));
    return app.exec();
}
