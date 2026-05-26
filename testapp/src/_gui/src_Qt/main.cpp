#include "cfg_model.hpp"
#include "QCoreApplication"
#include "QDebug"
#include "QGuiApplication"
#include "QQmlApplicationEngine"
#include "QQmlContext"
#include "QUrl"

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);
    app.setOrganizationName("devmarkusb");
    app.setOrganizationDomain("org");
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        [] {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    auto root_context = engine.rootContext();

    CfgModel cfg_model;
    root_context->setContextProperty(QStringLiteral("cfgModel"), &cfg_model);

    const QUrl main_qml_url(QStringLiteral("qrc:/testapp/gui/AppWindow.qml"));
    engine.load(main_qml_url);
    if (engine.rootObjects().isEmpty()) {
        qCritical() << "Failed to load" << main_qml_url;
        return -1;
    }
    return QGuiApplication::exec();
}
