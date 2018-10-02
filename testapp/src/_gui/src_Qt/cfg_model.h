#ifndef CFG_MODEL_H_ehuf73rhf874hf78y4fng
#define CFG_MODEL_H_ehuf73rhf874hf78y4fng

#include "toolib/warnings.h"
TOO_PRAGMA_WARNINGS_PUSH_DISABLE_ALL
#include <QObject>
TOO_PRAGMA_WARNINGS_POP


class CfgModel : public QObject
{
    Q_OBJECT

    //! true if started via qmlscene
    Q_PROPERTY(bool isGUIonlyMode READ isGUIonlyMode CONSTANT FINAL)

public:
    bool isGUIonlyMode() const { return false; }
};

#endif
