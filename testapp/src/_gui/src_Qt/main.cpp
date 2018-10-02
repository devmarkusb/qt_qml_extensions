#include "cfg_model.h"
#include "toolib/warnings.h"
TOO_PRAGMA_WARNINGS_PUSH_DISABLE_ALL
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
TOO_PRAGMA_WARNINGS_POP
#include <memory>


int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    auto root_context = engine.rootContext();

    CfgModel cfg_model;
    root_context->setContextProperty(QStringLiteral("cfgModel"), &cfg_model);

    engine.load(QUrl("qrc:/testapp/gui/AppWindow.qml"));
    return app.exec();
}
