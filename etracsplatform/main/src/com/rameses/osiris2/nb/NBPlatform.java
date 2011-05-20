/*
 * NBPlatform.java
 *
 * Created on July 13, 2010, 6:40 PM
 * @author jaycverg
 */
package com.rameses.osiris2.nb;

import com.rameses.osiris2.nb.windows.ErrorDialog;
import com.rameses.osiris2.nb.windows.FloatingWindow;
import com.rameses.osiris2.nb.windows.NBMainWindow;
import com.rameses.osiris2.nb.windows.NBPopup;
import com.rameses.osiris2.nb.windows.NBSubWindow;
import com.rameses.osiris2.nb.windows.StartupWindow;
import com.rameses.platform.interfaces.MainWindow;
import com.rameses.platform.interfaces.Platform;
import com.rameses.platform.interfaces.SubWindow;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dialog;
import java.awt.EventQueue;
import java.awt.Frame;
import java.awt.KeyboardFocusManager;
import java.awt.Window;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import org.apache.commons.beanutils.PropertyUtils;
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
    
    //<editor-fold defaultstate="collapsed" desc="  show top component  ">
    public void showStartupWindow(JComponent actionSource, JComponent comp, Map properties) {
        final Map props = properties;
        final JComponent content = comp;
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                String title = (String) props.get("title");
                
                if ( title != null ) {
                    startupWindow.setDisplayName(title);
                }
                
                startupWindow.removeAll();
                SwingUtilities.updateComponentTreeUI( startupWindow );
                startupWindow.add(content);
            }
        });
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
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="  show popup  ">
    public void showPopup(JComponent actionSource, JComponent comp, Map properties) {
        String id = (String) properties.remove("id");
        if (id == null || id.trim().length() == 0)
            throw new IllegalStateException("Id is required when showing a window.");
        
        if (!windows.containsKey(id)) {
            Window parent = getFocusedWindow();
            
            NBPopup popup = null;
            if ( parent instanceof Frame )
                popup = new NBPopup(this, (Frame) parent, id);
            else if ( parent instanceof Dialog )
                popup = new NBPopup(this, (Dialog) parent, id);
            else
                popup = new NBPopup(this, (Frame) (parent=(Window)mainWindow.getComponent()), id);
            
            
            String title = (String) properties.remove("title");
            String strModal = properties.remove("modal")+"";
            
            if ( !properties.isEmpty() ) setProperties(popup, properties);
            
            if (title == null || title.trim().length() == 0) title = id;
            boolean modal = !(strModal+"").equals("false");
            
            popup.setTitle(title);
            popup.setModal(modal);
            popup.setContentPane(comp);
            windows.put(id, popup);
            
            popup.pack();
            popup.setLocationRelativeTo(parent);
            
            final Window d = popup;
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    d.setVisible(true);
                }
            });
        } else {
            ((Component) windows.get(id)).requestFocus();
        }
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="  show floating window  ">
    public void showFloatingWindow(JComponent owner, JComponent comp, Map properties) {
        String id = (String) properties.remove("id");
        if (id == null || id.trim().length() == 0)
            throw new IllegalStateException("Id is required when showing a window.");
        
        if (!windows.containsKey(id)) {
            FloatingWindow fw = new FloatingWindow(id, owner, properties);
            fw.add(comp);
            
            Container glassPane = null;
            if ( owner == null ) {
                glassPane = (Container) ((JFrame)mainWindow.getComponent()).getGlassPane();
            } else {
                glassPane = getGlassPane(owner);
            }
            
            if ( !glassPane.isVisible() ) {
                glassPane.setVisible(true);
            }
            
            glassPane.add(fw);
            glassPane.invalidate();
            glassPane.validate();
            windows.put(id, fw);
        } else {
            ((Component) windows.get(id)).requestFocus();
        }
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="  helper methods  ">
    private void setProperties(Object bean, Map properties) {
        for(Map.Entry me: (Set<Map.Entry>) properties.entrySet()) {
            try {
                PropertyUtils.setNestedProperty(bean, me.getKey().toString(), me.getValue());
            }catch(Exception e) {;}
        }
    }
    
    private Container getGlassPane(JComponent comp) {
        Container parent = comp.getParent();
        while( parent != null ) {
            if ( parent instanceof NBSubWindow ) {
                return ((NBSubWindow) parent).getGlassPane();
            }
            if ( parent instanceof JFrame ) {
                return (Container) ((JFrame) parent).getGlassPane();
            }
            parent = parent.getParent();
        }
        return (NBSubWindow) parent;
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="  Message box support  ">
    public void showError(JComponent actionSource, Exception e) {
        Component c = actionSource;
        if (c == null) c = mainWindow.getComponent();
        
        ErrorDialog.show(e, c);
    }
    
    public boolean showConfirm(JComponent actionSource, Object message) {
        int resp = JOptionPane.showConfirmDialog(getFocusedWindow(), message, "Confirm", JOptionPane.YES_NO_OPTION);
        return resp == JOptionPane.YES_OPTION;
    }
    
    public void showInfo(JComponent actionSource, Object message) {
        JOptionPane.showMessageDialog(getFocusedWindow(), message.toString(), "Message", JOptionPane.INFORMATION_MESSAGE);
    }
    
    public void showAlert(JComponent actionSource, Object message) {
        JOptionPane.showMessageDialog(getFocusedWindow(), message.toString(), "Message", JOptionPane.WARNING_MESSAGE);
    }
    
    public Object showInput(JComponent actionSource, Object message) {
        return JOptionPane.showInputDialog(getFocusedWindow(), message);
    }
    
    private Window getFocusedWindow() {
        Window w = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusedWindow();
        if( w != null && w.isShowing() ) return w;
        
        return (Window) mainWindow.getComponent();
    }
    //</editor-fold>
    
    public MainWindow getMainWindow() {
        return mainWindow;
    }
    
    public void closeWindow(String id) {
        if (windows.containsKey(id)) {
            SubWindow win = (SubWindow) windows.get(id);
            win.closeWindow();
        }
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
    
    public void unregisterWindow(String id) {
        windows.remove(id);
    }
    
    public void registerWindow(String id, Component window) {
        windows.put(id, window);
    }
    
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
                    nbs.forceClose();
                } else {
                    win.closeWindow();
                }
            }
        }
        return true;
    }
    
    public void lock() {}
    
    public void unlock() {}
}
