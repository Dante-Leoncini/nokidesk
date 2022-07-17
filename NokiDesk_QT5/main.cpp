#include <QDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlFileSelector>
#include <QQuickStyle>


#include <QGuiApplication>
#include <QtQuick/QQuickView>

//Para el Block de Notas
#include "fileio.h"
#include "documenthandler.h"
#include <QFontDatabase>

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    QFontDatabase fontDatabase;
    if (fontDatabase.addApplicationFont(":/qml/fuentes/fontello.ttf") == -1)
        qWarning() << "Failed to load fontello.ttf";

    qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<DocumentHandler>("io.qt.texteditor", 1, 0, "DocumentHandler");

    QQuickView view;
    view.setSource(QUrl("qrc:///qml/Main.qml"));

    view.setTitle("Nokidesk");
    view.setMinimumSize(QSize(1280, 720));
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    //view.setWidth(640);
    //view.setHeight(360);
    //view.showFullScreen();
    view.show();

    return app.exec();
}
