/*
 * ViewContext.java
 *
 * Created on January 3, 2010, 7:32 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.platform.interfaces;

/**
 * normally implemented by UIControllerPanel
 */
public interface ViewContext {
    
    static final long serialVersionUID = 1L;
    
    boolean close();
    void display();
    void setSubWindow(SubWindow subWindow);
    SubWindow getSubWindow();
    
}
