#ifndef CFG_MODEL_H_ehuf73rhf874hf78y4fng
#define CFG_MODEL_H_ehuf73rhf874hf78y4fng

#include "ul/ul.h"
UL_PRAGMA_WARNINGS_PUSH_AND_DISABLE_ALL_MSVC
#include <QObject>
UL_PRAGMA_WARNINGS_POP


class CfgModel : public QObject
{
    Q_OBJECT

    //! true if started via qmlscene
    Q_PROPERTY(bool isGUIonlyMode READ isGUIonlyMode CONSTANT FINAL)

public:
    static bool isGUIonlyMode()
    {
        return false;
    }
};

#endif
