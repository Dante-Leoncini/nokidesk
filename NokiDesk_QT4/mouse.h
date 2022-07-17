#ifndef MOUSE_H
#define MOUSE_H

#include <QCursor>
#include <QObject>
#include <QDebug>

class MouseD : public QObject
{
    Q_OBJECT

public:
    explicit MouseD(QObject *parent = 0);

    Q_INVOKABLE bool write(const QString& data);
    Q_INVOKABLE int GlobalCursorPos() const{
           return 1;
    }
    Q_INVOKABLE QPoint GlobalCursorPos2() const{
           return QCursor::pos();
    }
    //Q_INVOKABLE int posicion(){
        //QCursor::setPos(10, 10);
    //};

public slots:
    void cppSlot() {
    qDebug() << "Called the C++ slot with";
    }
};

#endif // MOUSE_H
