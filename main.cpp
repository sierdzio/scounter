#include "qtquick2controlsapplicationviewer.h"
#include "scdatehandler.h"

#include <QObject>
#include <QtQml>
#include <QQmlEngine>
#include <QJSEngine>

static QObject *scSingleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    ScDateHandler *handler = new ScDateHandler();
    return handler;
}

int main(int argc, char *argv[])
{
    Application app(argc, argv);
    app.setApplicationName("SCounter");
    app.setApplicationVersion("1.0");
    app.setOrganizationName("sierdzio");
    app.setOrganizationDomain("com.sierdzio");

    qmlRegisterSingletonType<ScDateHandler>("SCounter", 1, 0, "DateHandler", scSingleton);

    QtQuick2ControlsApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/scounter/main.qml"));
    viewer.show();

    return app.exec();
}

