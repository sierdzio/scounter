//#include "qtquick2controlsapplicationviewer.h"
#include "scdatehandler.h"

#include <QObject>
#include <QUrl>
#include <QtQml>
#include <QQmlEngine>
#include <QJSEngine>
#include <QQuickView>
#include <QApplication>

static QObject *scSingleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    ScDateHandler *handler = new ScDateHandler();
    return handler;
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setApplicationName("SCounter");
    app.setApplicationVersion("1.0");
    app.setOrganizationName("sierdzio");
    app.setOrganizationDomain("com.sierdzio");

    qmlRegisterSingletonType<ScDateHandler>("SCounter", 1, 0, "DateHandler", scSingleton);

    QQuickView viewer;
    viewer.setSource(QUrl("qrc:///qml/scounter/main.qml"));
    //QtQuick2ControlsApplicationViewer viewer;
    //viewer.setMainQmlFile(QStringLiteral("qrc://qml/scounter/main.qml"));
    viewer.show();

    return app.exec();
}

