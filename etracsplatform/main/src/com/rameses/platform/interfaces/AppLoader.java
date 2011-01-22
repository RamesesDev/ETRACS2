package com.rameses.platform.interfaces;

import java.util.Map;

public interface AppLoader {
    
    public static final long serialVersionUID = 1L;
    public abstract void load(ClassLoader loader, Map env, Platform platform);
    public abstract void restore();
    
}
