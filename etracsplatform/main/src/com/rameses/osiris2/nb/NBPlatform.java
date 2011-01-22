/*
 * NBPlatform.java
 *
 * Created on July 13, 2010, 6:40 PM
 * @author jaycverg
 */
package com.rameses.osiris2.nb;

import com.rameses.platform.interfaces.MainWindow;
import com.rameses.platform.interfaces.Platform;
import com.rameses.platform.interfaces.SubWindow;
import java.awt.Component;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import org.openide.windows.Mode;
import org.openide.windows.TopComponent;
import org.openide.windows.WindowManager;

public class NBPlatform implements Platform {
    
    private TopComponent startupWindow;
    private NBMainWindow mainWindow;
    private Hashtable windows = new Hashtable();
    
    
    public NBPlatform(NBMainWindow mainWindow, TopComponent startupWindow) {
        this.mainWindow = mainWindow;
        this.startupWindow = startupWindow;
    }
    
    //<editor-fold defaultstate="collapsed" desc="  window/popup support  ">
    public void showStartupWindow(JComponent actionSource, JComponent comp, Map properties) {
        String title = (String) properties.get("title");
        
        //if ( title != null )
        //    startupWindow.setDisplayName(title);
        
        startupWindow.removeAll();
        SwingUtilities.updateComponentTreeUI( startupWindow );
        startupWindow.add(comp);
    }
    
    public void showWindow(JComponent actionSource, JComponent comp, Map properties) {
        String id = (String) properties.get("id");
        if (id == null || id.trim().length() == 0)
            throw new IllegalStateException("Id is required when showing a window.");
        
        NBSubWindow win = null;
        if (!windows.containsKey(id)) {
            win = new NBSubWindow(this, mainWindow, id);
            win.putClientProperty("netbeans.winsys.tc.keep_preferred_size_when_slided_in", Boolean.TRUE);
            win.add(comp);
            
            if ("true".equals(properties.get("dragging_disabled")))
                win.putClientProperty("netbeans.winsys.tc.dragging_disabled", Boolean.TRUE);
            
            String closeable = properties.get("canclose")+"";
            if ("false".equalsIgnoreCase(closeable)) {
                win.setCloseable(false);
                win.putClientProperty("netbeans.winsys.tc.closing_disabled", Boolean.TRUE);
            } else
                win.setCloseable(true);
            
            String title = (String) properties.get("title");
            if (title == null || title.trim().length() == 0) title = id;
            
            win.setDisplayName(title);
            windows.put(id, win);
            
            String windowmode = (String) properties.get("windowmode");
            if (windowmode != null && windowmode.trim().length() > 0) {
                Mode winmode = WindowManager.getDefault().findMode(windowmode);
                if (winmode != null) {
                    winmode.dockInto(win);
                    win.putClientProperty("netbeans.winsys.tc.dragging_disabled", Boolean.TRUE);
                }
            }
            
            win.open();
        } else {
            win = (NBSubWindow) windows.get(id);
        }
        
        win.requestActive();
        comp.requestFocus();
    }
    
    private Field findField(Class clazz, String name) throws Exception {
        Class c = clazz;
        while (c != null) {
            Field[] flds = c.getDeclaredFields();
            for (int i=0; i<flds.length; i++) {
                if (flds[i].getName().equals(name))
                    return flds[i];
            }
            c = c.getSuperclass();
        }
        return null;
    }
    
    public boolean isWindowExists(String id) {
        return windows.containsKey(id);
    }
    
    public void activateWindow(String id) {
        if (windows.containsKey(id)) {
            SubWindow win = (SubWindow) windows.get(id);
            if (win instanceof NBSubWindow)
                ((NBSubWindow) win).requestActive();
        }
    }
    
    public void removeWindow(String id) {
        windows.remove(id);
    }
    
    public void showPopup(JComponent actionSource, JComponent comp, Map properties) {
        String id = (String) properties.get("id");
        if (id == null || id.trim().length() == 0)
            throw new IllegalStateException("Id is required when showing a window.");
        
        if (!windows.containsKey(id)) {
            JFrame parent = (JFrame) mainWindow.getComponent();
            
            final NBPopup popup = new NBPopup(this, parent, id);
            popup.setContentPane(comp);
            
            String title = (String) properties.get("title");
            if (title == null || title.trim().length() == 0) title = id;
            
            String strModal = properties.get("modal")+"";
            boolean modal = !(strModal+"").equals("false");
            
            popup.setTitle(title);
            windows.put(id, popup);
            
            popup.pack();
            popup.setLocationRelativeTo(parent);
            popup.setModal(modal);
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    popup.setVisible(true);
                }
            });
        } else {
            ((NBPopup) windows.get(id)).requestFocus();
        }
    }
    
    public void showError(JComponent actionSource, Exception e) {
        Component c = actionSource;
        if (c == null) c = mainWindow.getComponent();
        
        ErrorDialog.show(e, c);
    }
    
    public boolean showConfirm(JComponent actionSource, Object message) {
        int resp = JOptionPane.showConfirmDialog(mainWindow.getComponent(), message, "Confirm", JOptionPane.YES_NO_OPTION);
        return resp == JOptionPane.YES_OPTION;
    }
    
    public void showInfo(JComponent actionSource, Object message) {
        JOptionPane.showMessageDialog(mainWindow.getComponent(), message.toString(), "Message", JOptionPane.INFORMATION_MESSAGE);
    }
    
    public void showAlert(JComponent actionSource, Object message) {
        JOptionPane.showMessageDialog(mainWindow.getComponent(), message.toString(), "Message", JOptionPane.WARNING_MESSAGE);
    }
    
    public Object showInput(JComponent actionSource, Object message) {
        return JOptionPane.showInputDialog(mainWindow.getComponent(), message);
    }
    
    public MainWindow getMainWindow() {
        return mainWindow;
    }
    
    public void closeWindow(String id) {
        if (windows.containsKey(id)) {
            SubWindow win = (SubWindow) windows.get(id);
            win.closeWindow();
        }
    }
    
    private String getMessage(Throwable t) {
        if (t == null) return null;
        
        String msg = t.getMessage();
        Throwable cause = t.getCause();
        while (cause != null) {
            String s = cause.getMessage();
            if (s != null) msg = s;
            
            cause = cause.getCause();
        }
        return msg;
    }
    //</editor-fold>
    
    public void shutdown() {
        mainWindow.close();
    }
    
    /**
     * @description
     *      logoff() method re-checks the update center and downloads new updates
     */
    public void logoff() {
        try {
            if ( closeAll() ) {
                
                //clean up the screen.
                NBManager.getInstance().getHeaderBar().removeAll();
                NBManager.getInstance().getStatusView().removeAll();
                startupWindow.removeAll();
                SwingUtilities.updateComponentTreeUI( startupWindow );
        
                ((StartupWindow)startupWindow).start();
                /*
                NBPlatformLoader.DownloadResult res = NBPlatformLoader.download();
                res.getAppLoader().load( res.getClassLoader(), res.getEnv(), this);
                 */
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            showError((JComponent) mainWindow.getComponent(), e);
        }
    }
    
    public boolean closeAll() {
        if (mainWindow.getListener() != null) {
            try {
                if ( !mainWindow.getListener().onClose() ) return false;
            } catch(Exception e) {
                e.printStackTrace();
                ErrorDialog.show(e);
            }
        }
        
        if ( !windows.isEmpty() ) {
            Map m = new HashMap();
            m.putAll(windows);
            
            for(Map.Entry me: (Set<Map.Entry>) m.entrySet()) {
                SubWindow win = (SubWindow) windows.get(me.getKey());
                if ( win instanceof NBSubWindow ) {
                    NBSubWindow nbs = (NBSubWindow) win;
                    if ( !nbs.canClose() ) return false;
                    nbs.setCloseable(true);
                }
                win.closeWindow();
            }
        }
        
        //SwingUtilities.updateComponentTreeUI( f.getContentPane() );
        
        return true;
    }
}
