#ifndef CANVAS_H
#define CANVAS_H

#include <QObject>

//Necesario para que ande la clase ImageProvider
#include <QDeclarativeImageProvider>


class Canvas : public QObject
{
};

//Se encarga de crear imagenes dinamicas
class ImageProvider : public QDeclarativeImageProvider
{
public:
    ImageProvider()
        : QDeclarativeImageProvider(QDeclarativeImageProvider::Pixmap)
    {
    }

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
    {
        int ancho = 300;
        int alto = 300;

        if (size)
            *size = QSize(ancho, alto);
        QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : ancho,
                       requestedSize.height() > 0 ? requestedSize.height() : alto);
        pixmap.fill(QColor(255, 255, 255, 255)); //pixmap.fill(QColor(id).rgba());

        // Escribe el nombre del color
        QPainter painter(&pixmap);
        QFont f = painter.font();
        f.setPixelSize(1);
        painter.setFont(f);

        if (requestedSize.isValid())
            painter.scale(requestedSize.width() /10, requestedSize.height() / 10);
            painter.setPen(QColor(255, 0, 0, 255));
            painter.drawText(QRectF(0, 0, 10, 10), Qt::AlignCenter, id);
            painter.setPen(Qt::black); //Color del pincel

            painter.drawText(QRectF(0, 0, 0.1, 0.1), Qt::AlignRight, QString::number(requestedSize.height())); //Dibuja ancho
            //painter.drawText(QRectF(0, 0, ancho, alto), Qt::AlignHCenter, "pruebaaa"); //Dibuja texto

            QLineF line(0.1, 0.8, 0.9, 0.2); //Cordenadas de la linea
            painter.drawLine(line); //Dibuja la linea

        if (1 <= 0)
            painter.setPen(QColor(255, 0, 0, 255));
            QLineF line2(0.0, 0.0, 0.5, 0.5); //Cordenadas de la linea
            painter.drawLine(line2); //Dibuja la linea

            painter.setPen(QColor(0, 0, 0, 255));
            QRectF rectangle(0.1, 0.2, 0.8, 0.6);
            painter.drawEllipse(rectangle);

        return pixmap;
    }
};

#endif // CANVAS_H
