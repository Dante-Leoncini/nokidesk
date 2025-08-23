#include "mouse.h"
#include <QCursor>

MouseD::MouseD(QObject *parent) :
    QObject(parent)
{

}

bool MouseD::write(const QString& data)
{
    return true;
}
