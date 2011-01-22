package com.rameses.platform.interfaces;

import javax.swing.JComponent;

public interface MainWindow {
    
    static final long serialVersionUID = 1L;
    
    //constraints
    static final String TOOLBAR = "toolbar";
    static final String MENUBAR = "menubar";
    static final String CONTENT = "content";
    static final String STATUSBAR = "statusbar";
    
    void setListener( MainWindowListener listener );
    void setComponent( JComponent comp, String constraint );
    void setTitle(String title);
    void close();
    void show();
}
