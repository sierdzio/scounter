QT += core gui qml quick

TARGET = scounter

SOURCES += src/main.cpp \
    src/scdatehandler.cpp

HEADERS += \
    src/scdatehandler.h

OTHER_FILES += \
    android/AndroidManifest.xml \
    .gitignore \
    README.txt \
    AUTHORS.txt \
    LICENSE.txt

RESOURCES += \
    qmlResource.qrc

ANDROID_PACKAGE_SOURCE_DIR = android

BUILDDIR = build

DESTDIR = $${BUILDDIR}
OBJECTS_DIR = $${BUILDDIR}
MOC_DIR = $${BUILDDIR}
RCC_DIR = $${BUILDDIR}
UI_DIR = $${BUILDDIR}

