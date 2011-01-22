/*
 * MainWindowListener.java
 *
 * Created on November 19, 2009, 9:04 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.platform.interfaces;

/**
 *
 * @author elmo
 */
public interface MainWindowListener {
    
    Object onEvent(String eventName, Object evt);
    boolean onClose();
    
}
