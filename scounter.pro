# Add more folders to ship with the application, here
folder_01.source = qml/scounter
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
#QML_IMPORT_PATH =

# Installation path
# target.path =

# The .cpp file which was generated for your project. Feel free to hack it.
QT += core gui qml quick

SOURCES += main.cpp \
    scdatehandler.cpp

# Please do not modify the following two lines. Required for deployment.
include(qtquick2controlsapplicationviewer/qtquick2controlsapplicationviewer.pri)
qtcAddDeployment()

#ANDROID_EXTRA_LIBS =

HEADERS += \
    scdatehandler.h

OTHER_FILES += \
    qml/scounter/TimeLabel.qml \
    qml/scounter/TimePicker.qml \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
