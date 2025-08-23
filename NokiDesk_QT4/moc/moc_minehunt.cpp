/****************************************************************************
** Meta object code from reading C++ file 'minehunt.h'
**
** Created: Fri 22. Aug 16:37:24 2025
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../minehunt.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'minehunt.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_TileData[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       4,   34, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x05,
      27,    9,    9,    9, 0x05,
      44,    9,    9,    9, 0x05,
      58,    9,    9,    9, 0x05,

 // properties: name, type, flags
      80,   75, 0x01495103,
      88,   75, 0x01495001,
     100,   96, 0x02495001,
     105,   75, 0x01495001,

 // properties: notify_signal_id
       1,
       3,
       2,
       0,

       0        // eod
};

static const char qt_meta_stringdata_TileData[] = {
    "TileData\0\0flippedChanged()\0hasFlagChanged()\0"
    "hintChanged()\0hasMineChanged()\0bool\0"
    "hasFlag\0hasMine\0int\0hint\0flipped\0"
};

const QMetaObject TileData::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TileData,
      qt_meta_data_TileData, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TileData::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TileData::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TileData::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TileData))
        return static_cast<void*>(const_cast< TileData*>(this));
    return QObject::qt_metacast(_clname);
}

int TileData::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: flippedChanged(); break;
        case 1: hasFlagChanged(); break;
        case 2: hintChanged(); break;
        case 3: hasMineChanged(); break;
        default: ;
        }
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = hasFlag(); break;
        case 1: *reinterpret_cast< bool*>(_v) = hasMine(); break;
        case 2: *reinterpret_cast< int*>(_v) = hint(); break;
        case 3: *reinterpret_cast< bool*>(_v) = flipped(); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setHasFlag(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void TileData::flippedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void TileData::hasFlagChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void TileData::hintChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void TileData::hasMineChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}
static const uint qt_meta_data_MinehuntGame[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       5,   54, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x05,
      33,   13,   13,   13, 0x05,
      49,   13,   13,   13, 0x05,
      67,   13,   13,   13, 0x05,

 // slots: signature, parameters, type, tag, flags
      98,   90,   85,   13, 0x0a,
     112,   90,   85,   13, 0x0a,
     126,   13,   13,   13, 0x0a,
     137,   13,   13,   13, 0x0a,

 // properties: name, type, flags
     180,  145, 0x00095409,
     186,   85, 0x01495001,
     196,   85, 0x01495001,
     207,  203, 0x02495001,
     216,  203, 0x02495001,

 // properties: notify_signal_id
       0,
       0,
       1,
       2,
       3,

       0        // eod
};

static const char qt_meta_stringdata_MinehuntGame[] = {
    "MinehuntGame\0\0isPlayingChanged()\0"
    "hasWonChanged()\0numMinesChanged()\0"
    "numFlagsChanged()\0bool\0row,col\0"
    "flip(int,int)\0flag(int,int)\0setBoard()\0"
    "reset()\0QDeclarativeListProperty<TileData>\0"
    "tiles\0isPlaying\0hasWon\0int\0numMines\0"
    "numFlags\0"
};

const QMetaObject MinehuntGame::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MinehuntGame,
      qt_meta_data_MinehuntGame, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MinehuntGame::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MinehuntGame::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MinehuntGame::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MinehuntGame))
        return static_cast<void*>(const_cast< MinehuntGame*>(this));
    return QObject::qt_metacast(_clname);
}

int MinehuntGame::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: isPlayingChanged(); break;
        case 1: hasWonChanged(); break;
        case 2: numMinesChanged(); break;
        case 3: numFlagsChanged(); break;
        case 4: { bool _r = flip((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 5: { bool _r = flag((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 6: setBoard(); break;
        case 7: reset(); break;
        default: ;
        }
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QDeclarativeListProperty<TileData>*>(_v) = tiles(); break;
        case 1: *reinterpret_cast< bool*>(_v) = isPlaying(); break;
        case 2: *reinterpret_cast< bool*>(_v) = hasWon(); break;
        case 3: *reinterpret_cast< int*>(_v) = numMines(); break;
        case 4: *reinterpret_cast< int*>(_v) = numFlags(); break;
        }
        _id -= 5;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 5;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MinehuntGame::isPlayingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void MinehuntGame::hasWonChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void MinehuntGame::numMinesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void MinehuntGame::numFlagsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}
QT_END_MOC_NAMESPACE
