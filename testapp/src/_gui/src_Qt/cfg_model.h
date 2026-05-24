#ifndef CFG_MODEL_H_ehuf73rhf874hf78y4fng
#define CFG_MODEL_H_ehuf73rhf874hf78y4fng

#include "QObject"

class CfgModel : public QObject {
    Q_OBJECT

    //! true if started via qmlscene
    Q_PROPERTY(bool isGUIonlyMode READ isGUIonlyMode CONSTANT FINAL)

public:
    static bool isGUIonlyMode() {
        return false;
    }
};

#endif
