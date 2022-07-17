#include "colorimageprovider.h"

class ColorImageProvider : public QDeclarativeImageProvider
{
public:
    ColorImageProvider()
        : QDeclarativeImageProvider(QDeclarativeImageProvider::Pixmap)
    {
    }

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
    {
        int width = 100;
        int height = 50;

        if (size)
            *size = QSize(width, height);
        QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                       requestedSize.height() > 0 ? requestedSize.height() : height);
        pixmap.fill(QColor(id).rgba());

        return pixmap;
    }
};
