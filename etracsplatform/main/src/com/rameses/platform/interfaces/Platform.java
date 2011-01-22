package com.rameses.platform.interfaces;

import java.util.Map;
import javax.swing.JComponent;

/**
 *
 * @author jaycverg
 */
public interface Platform {
    
    static final long serialVersionUID = 1L;
    /**
     * actionSource must the component that triggers the action,
     * it could be a JButton, JMenu, etc.
     */
    void showStartupWindow(JComponent actionSource, JComponent comp, Map properties);
    void showWindow(JComponent actionSource, JComponent comp, Map properties);
    boolean isWindowExists(String id);
    void activateWindow(String id);
    void closeWindow(String id);
    void showPopup(JComponent actionSource, JComponent comp, Map properties);
    void showError(JComponent actionSource, Exception e); //shows fatal errors
    boolean showConfirm(JComponent actionSource, Object message); //shows a confirmation message box
    void showInfo(JComponent actionSource, Object message); //shows plain information
    void showAlert(JComponent actionSource, Object message); //shows warning messages
    Object showInput(JComponent actionSource, Object message); //shows an input message box
    MainWindow getMainWindow();
    
    //platform management methods
    void shutdown();
    void logoff();
    
}
