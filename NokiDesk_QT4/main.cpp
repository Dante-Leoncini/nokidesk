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

    //Block de notas
    qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");

    //Block de notas
    qmlRegisterType<Canvas, 1>("Canvas", 1, 0, "Canvas");

    //Buscaminas
    qmlRegisterType<TileData>();
    MinehuntGame* game = new MinehuntGame();

    //Salidad hdmi o pantalla externa
    QDesktopWidget *WidgetEscritorio = app.desktop();
    //QWidget *tvWidget = WidgetEscritorio->screen(1);


    QmlApplicationViewer viewer;

    //Dice el tamaño de la pantalla
    viewer.rootContext()->setContextProperty("altoSalida", WidgetEscritorio->screenGeometry(1).height());
    viewer.rootContext()->setContextProperty("anchoSalida", WidgetEscritorio->screenGeometry(1).width());

    viewer.engine()->rootContext()->setContextObject(game);
    viewer.setMainQmlFile(QLatin1String("qml/qml/qml/main.qml"));

    viewer.engine()->addImageProvider("canvas", new ImageProvider);

    viewer.show();

    //Si Hay una pantalla externa conectada se abre
    //El trackpad en el celular
    //QmlApplicationViewer celular;
    //celular.setMainQmlFile(QLatin1String("qml/qml/celular.qml"));


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
