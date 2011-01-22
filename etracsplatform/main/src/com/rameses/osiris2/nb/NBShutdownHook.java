package com.rameses.osiris2.nb;

import org.openide.modules.ModuleInstall;

/**
 * Manages a module's lifecycle. Remember that an installer is optional and
 * often not needed at all.
 */
public class NBShutdownHook extends ModuleInstall {
    
    public boolean closing() 
    {
        return NBManager.getInstance().getPlatform().closeAll();
    }
    
}
