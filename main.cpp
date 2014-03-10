#include "scdatehandler.h"

#include <QObject>
#include <QUrl>
#include <QtQml>
#include <QQuickView>
#include <QGuiApplication>

class QQmlEngine;
class QJSEngine;

static QObject *scSingleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    ScDateHandler *handler = new ScDateHandler();
    return handler;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("SCounter");
    app.setApplicationVersion("1.0");
    app.setOrganizationName("sierdzio");
    app.setOrganizationDomain("com.sierdzio");

    qmlRegisterSingletonType<ScDateHandler>("SCounter", 1, 0, "DateHandler", scSingleton);

    QQuickView viewer;
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:///qml/scounter/main.qml"));
    viewer.show();

    return app.exec();
}

