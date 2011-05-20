/*
 * FloatingWindow.java
 *
 * Created on December 14, 2010, 3:05 PM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import com.rameses.osiris2.nb.NBManager;
import com.rameses.osiris2.nb.NBPlatform;
import com.rameses.platform.interfaces.SubWindow;
import java.awt.AWTEvent;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Container;
import java.awt.EventQueue;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.AWTEventListener;
import java.awt.event.FocusEvent;
import java.awt.event.MouseEvent;
import java.util.Map;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.event.AncestorEvent;
import javax.swing.event.AncestorListener;


public class FloatingWindow extends JPanel implements SubWindow, Draggable {
    
    private String windowId;
    private Map properties;
    private Rectangle handle;
    private Point anchor;
    
    private JComponent target;
    private boolean focusTargetOnClose = true;
    private Component parent;
    private EventSupport eventSupport = new EventSupport();
    
    
    public FloatingWindow(String id, JComponent target, Map properties) {
        this.windowId = id;
        this.target = target;
        this.properties = properties;
        
        setFocusCycleRoot(true);
        setOpaque(false);
        setFocusable(true);
        setLayout(new BorderLayout());
        setBorder(new FloatingWindowBorder());
        
        addAncestorListener(eventSupport);
        Toolkit.getDefaultToolkit().addAWTEventListener(eventSupport, AWTEvent.MOUSE_EVENT_MASK | AWTEvent.FOCUS_EVENT_MASK);
        
    }
    
    public void closeWindow() {
        Toolkit.getDefaultToolkit().removeAWTEventListener(eventSupport);
        
        if ( target != null) {
            if ( focusTargetOnClose ) {
                EventQueue.invokeLater(new Runnable() {
                    public void run() {
                        target.requestFocusInWindow();
                    }
                });
            }
        }
        Container parent = getParent();
        if ( parent != null ) {
            setVisible(false);
            parent.remove(this);
        }
    }
    
    protected void addImpl(Component comp, Object constraints, int index) {
        super.addImpl(comp, constraints, index);
        
    }
    
    
    //<editor-fold defaultstate="collapsed" desc="  getters/setters  ">
    public void setTitle(String title) {
    }
    
    public JComponent getTarget() {
        return target;
    }
    
    public void setTarget(JComponent target) {
        this.target = target;
    }
    
    public Map getProperties() {
        return properties;
    }
    
    public void setProperties(Map properties) {
        this.properties = properties;
    }
    
    private boolean isCloseOnFocusLost() {
        return properties == null || !"false".equals(properties.get("closeOnFocusLost")+"");
    }
    
    public boolean isDraggable() {
        return properties == null || !"false".equals(properties.get("draggable")+"");
    }
    
    public Rectangle getHandleBounds() {
        return handle;
    }
    
    public Point getAnchorPoint() {
        return anchor;
    }
    
    public void setAnchorPoint(Point p) {
        this.anchor = p;
    }
    //</editor-fold>
    
    
    //<editor-fold defaultstate="collapsed" desc="  EventSupport (class)  ">
    private class EventSupport implements AncestorListener, AWTEventListener {
        
        public void ancestorMoved(AncestorEvent event) {}
        
        public void ancestorAdded(AncestorEvent event) {
            NBPlatform platform = NBManager.getInstance().getPlatform();
            if ( !platform.isWindowExists(windowId) ) {
                platform.registerWindow(windowId, FloatingWindow.this);
            }
        }
        
        public void ancestorRemoved(AncestorEvent event) {
            try {
                NBManager.getInstance().getPlatform().unregisterWindow(windowId);
            } catch(Exception e){}
        }
        
        public void eventDispatched(AWTEvent event) {
            int id = event.getID();
            if ( id != MouseEvent.MOUSE_PRESSED && id != FocusEvent.FOCUS_GAINED ) return;
            
            Component comp = (Component) event.getSource();
            if ( comp == FloatingWindow.this )
                requestFocusInWindow();
            else if ( isCloseOnFocusLost() )
                checkShouldClose(comp);
        }
        
        private void checkShouldClose(Component next) {
            if ( next != target && !next.isFocusCycleRoot(FloatingWindow.this) ) {
                focusTargetOnClose = false;
                closeWindow();
            }
        }
    }
    //</editor-fold>
    
}
