QT += core gui qml quick

SOURCES += main.cpp \
    scdatehandler.cpp

HEADERS += \
    scdatehandler.h

OTHER_FILES += \
    android/AndroidManifest.xml
    .gitignore

RESOURCES += \
    qmlResource.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

BUILDDIR = $$PWD/build/$$TARGET

DESTDIR = $${BUILDDIR}
OBJECTS_DIR = $${BUILDDIR}
MOC_DIR = $${BUILDDIR}
RCC_DIR = $${BUILDDIR}
UI_DIR = $${BUILDDIR}

