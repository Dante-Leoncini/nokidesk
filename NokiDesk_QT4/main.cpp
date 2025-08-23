#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "fileio.h"
#include "canvas.h"
#include "minehunt.h"
#include <QDebug>
#include <QDesktopWidget>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeEngine>
#include <QGraphicsObject>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // --- Registro de tipos QML ---
    #if (QT_VERSION >= QT_VERSION_CHECK(4, 8, 0))
        // Qt 4.8 y superior (Belle, Desktop…)
        qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");
        qmlRegisterType<Canvas, 1>("Canvas", 1, 0, "Canvas");
    #else
        // Qt 4.7 (Symbian^3, Anna, S60v3…)
        qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");
        qmlRegisterType<Canvas>("Canvas", 1, 0, "Canvas");
    #endif

    //Buscaminas
    qmlRegisterType<TileData>();
    MinehuntGame* game = new MinehuntGame();

    //Salidad hdmi o pantalla externa
    QDesktopWidget *WidgetEscritorio = app.desktop();
    //QWidget *tvWidget = WidgetEscritorio->screen(1);

    QmlApplicationViewer viewer;

    //Dice el tamaÃ±o de la pantalla
    //ya no tengo hdmi para testear estas cosas... capaz ya no hace falta con los ultimos cambios
    viewer.rootContext()->setContextProperty("altoSalida", WidgetEscritorio->screenGeometry(1).height());
    viewer.rootContext()->setContextProperty("anchoSalida", WidgetEscritorio->screenGeometry(1).width());

    //la pantalla cero es la pantalla del telefono. la 1 (si existe) es la salida hdmi
    QRect screenRect = WidgetEscritorio->screenGeometry(0); // pantalla principal
    viewer.rootContext()->setContextProperty("screenWidth", screenRect.width());
    viewer.rootContext()->setContextProperty("screenHeight", screenRect.height());

    viewer.engine()->rootContext()->setContextObject(game);
    viewer.setMainQmlFile(QLatin1String("qml/main.qml"));

    viewer.engine()->addImageProvider("canvas", new ImageProvider);

    //viewer.show();
    viewer.showFullScreen();

    //Si Hay una pantalla externa conectada se abre
    //El trackpad en el celular
    //QmlApplicationViewer celular;
    //celular.setMainQmlFile(QLatin1String("qml/celular.qml"));


    //if (1 == WidgetEscritorio->screenCount()){
        //Conecta celular.qml con c++
        //QObject *salidatv = qobject_cast< QObject * >( viewer.rootObject() );
        //QObject *trackpad = qobject_cast< QObject * >( celular.rootObject() );

        //Posiciones X e Y del Mouse
        //QObject::connect(trackpad, SIGNAL(enviarx(QString)), salidatv, SIGNAL(recibirx(QString)));
        //QObject::connect(trackpad, SIGNAL(enviary(QString)), salidatv, SIGNAL(recibiry(QString)));

        //celular.show();
    //};

    return app.exec();
}
