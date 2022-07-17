TEMPLATE = app
TARGET = texteditor
QT += quick quickcontrols2 qml quick
qtHaveModule(widgets): QT += widgets

SOURCES += main.cpp \
    fileio.cpp \
    documenthandler.cpp

RESOURCES += nokidesk.qrc \

target.path = $$[QT_INSTALL_EXAMPLES]/quick/demos/nokidesk
INSTALLS += target

HEADERS += \
    fileio.h \
    documenthandler.h

DISTFILES += \
    android-sources/AndroidManifest.xml

#ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources
