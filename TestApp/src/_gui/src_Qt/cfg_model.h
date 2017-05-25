#ifndef CFG_MODEL_H_ehuf73rhf874hf78y4fng
#define CFG_MODEL_H_ehuf73rhf874hf78y4fng

#include "Toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_BEGIN"
#include <QObject>
#include "Toolib/PPDefs/MSVC/SUPPRESS_WARNINGS_EXTERNAL_END"


class CfgModel : public QObject
{
    Q_OBJECT

    //! true if started via qmlscene
    Q_PROPERTY(bool isGUIonlyMode READ isGUIonlyMode CONSTANT FINAL)

public:
    bool isGUIonlyMode() const { return false; }
};

#endif
