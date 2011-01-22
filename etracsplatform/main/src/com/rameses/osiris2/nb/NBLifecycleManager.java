package com.rameses.osiris2.nb;

import org.openide.LifecycleManager;
import org.openide.util.RequestProcessor;

public class NBLifecycleManager 
{
    private static NBLifecycleManager instance;
    
    public static NBLifecycleManager getInstance()
    {
        if (instance == null)
            instance = new NBLifecycleManager();
        
        return instance;
    }
    
    private NBLifecycleManager() {
    }
 
    
    public void exit()
    {
        RequestProcessor.getDefault().post(new Runnable() 
        {
            public void run() {
                LifecycleManager.getDefault().exit();
            }
        });
    }
}
