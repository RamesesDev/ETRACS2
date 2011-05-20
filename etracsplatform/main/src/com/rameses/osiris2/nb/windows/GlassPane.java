/*
 * GlassPane.java
 *
 * Created on December 15, 2010, 10:20 AM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import java.awt.Component;
import java.awt.Container;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.LayoutManager;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import javax.swing.JComponent;
import javax.swing.JPanel;

public class GlassPane extends JPanel {
    
    private static final String MOVED_FLAG = "__moved";
    
    private Cursor moveCursor = Cursor.getPredefinedCursor(Cursor.MOVE_CURSOR);
    private MouseSupport mouseSupport = new MouseSupport();
    
    
    public GlassPane() {
        setOpaque(false);
        setLayout(new GlassPaneLayout());
        
        addComponentListener(new ComponentListener() {
            public void componentHidden(ComponentEvent e) {}
            public void componentMoved(ComponentEvent e) { revalidate(); }
            public void componentResized(ComponentEvent e) { revalidate(); }
            public void componentShown(ComponentEvent e) { revalidate(); }
        });
    }
    
    protected void addImpl(Component comp, Object constraints, int index) {
        super.addImpl(comp, constraints, index);
        if ( comp instanceof Draggable ) {
            comp.addMouseListener(mouseSupport);
            comp.addMouseMotionListener(mouseSupport);
        }
    }
    
    
    //<editor-fold defaultstate="collapsed" desc="  GlassPaneLayout (class)  ">
    private class GlassPaneLayout implements LayoutManager {
        
        public void addLayoutComponent(String name, Component comp) {}
        public void removeLayoutComponent(Component comp) {}
        
        public Dimension minimumLayoutSize(Container parent) {
            return new Dimension(100,100);
        }
        
        public Dimension preferredLayoutSize(Container parent) {
            return new Dimension(100,100);
        }
        
        public void layoutContainer(Container parent) {
            synchronized (parent.getTreeLock()) {
                for(Component c : getComponents()) {
                    if ( c instanceof FloatingWindow ) {
                        FloatingWindow fw = (FloatingWindow) c;
                        if ( fw.getClientProperty(MOVED_FLAG) != null ) {
                            layoutDraggable(fw);
                        } else if ( fw.getTarget() != null ) {
                            layoutRelative(fw, parent);
                        } else {
                            layoutCenter(fw, parent);
                        }
                    } else {
                        layoutCenter(c, parent);
                    }
                }
            }
        }
        
        private void layoutCenter(Component c, Container parent) {
            Dimension d = c.getPreferredSize();
            Dimension pd = parent.getSize();
            
            int x = (pd.width/2) - (d.width/2);
            int y = (pd.height/2) - (d.height/2);
            
            c.setBounds(x, y, d.width, d.height);
        }
        
        private void layoutDraggable(FloatingWindow fw) {
            Dimension parentSize = GlassPane.this.getSize();
            Rectangle bounds = fw.getBounds();
            
            int x = bounds.x;
            int y = bounds.y;
            if ( x + bounds.width > parentSize.width && parentSize.width - bounds.width >= 0 )
                x = parentSize.width - bounds.width;
            if ( y + bounds.height > parentSize.height && parentSize.height - bounds.height >= 0 )
                y = parentSize.height - bounds.height;
            
            fw.setLocation(x, y);
        }
        
        private void layoutRelative(FloatingWindow fw, Component parent) {
            //this might throw an error when on TopComponent, just ignore the error
            try {
                JComponent target = fw.getTarget();
                Point tPoint = target.getLocationOnScreen();
                Dimension tSize = target.getSize();
                Point basePoint = parent.getLocationOnScreen();
                
                Dimension fwSize = fw.getPreferredSize();
                String orientation = (String) fw.getProperties().get("orientation");
                Point location = getLocation(orientation, new Rectangle(tPoint, tSize), basePoint, fwSize);
                fw.setBounds(location.x, location.y, fwSize.width, fwSize.height);
            } catch(Exception e) {;}
        }
        
        private Point getLocation(String orientation, Rectangle target, Point basePoint, Dimension compSize) {
            String[] location = null;
            if ( orientation != null && orientation.trim().length() > 0 ) {
                String[] ss = orientation.split("\\s+");
                if ( ss.length == 1 ) location = new String[]{ ss[0], ss[0] };
                if ( ss.length > 1 ) location = ss;
            }
            //default value
            if ( location == null ) location = new String[]{"left", "bottom"};
            
            int x = 0, y = 0;
            if ( "left".equals(location[0]) )
                x = target.x - basePoint.x;
            else if ( "right".equals(location[0]) )
                x = target.x + target.width - basePoint.x - compSize.width;
            else
                x = target.x + (target.width/2) - basePoint.x + (compSize.width/2);
            
            if ( "bottom".equals(location[1]) )
                y = (target.y - basePoint.y) + target.height;
            else if ( "top".equals(location[1]) )
                y = target.y - basePoint.y - compSize.height;
            else
                y = target.y + (target.height/2) - basePoint.y + (compSize.height/2);
            
            return new Point(x, y);
        }
        
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="  MouseSupport (class)  ">
    private class MouseSupport implements MouseListener, MouseMotionListener {
        
        public void mouseClicked(MouseEvent e) {}
        public void mouseReleased(MouseEvent e) {}
        public void mouseEntered(MouseEvent e) {}
        
        public void mouseExited(MouseEvent e) {
            Component c = (Component) e.getSource();
            if ( !(c instanceof Draggable) ) return;
            
            if ( c.getCursor().equals(moveCursor) ) c.setCursor(Cursor.getDefaultCursor());
        }
        
        public void mouseMoved(MouseEvent e) {
            Component c = (Component) e.getSource();
            if ( !(c instanceof Draggable) ) return;
            
            Draggable d = (Draggable) c;
            if ( d.getHandleBounds() == null || d.getHandleBounds().contains(e.getPoint()) )
                c.setCursor( moveCursor );
            else
                c.setCursor( Cursor.getDefaultCursor() );
        }
        
        public void mousePressed(MouseEvent e) {
            Component c = (Component) e.getSource();
            if ( !(c instanceof Draggable) ) return;
            
            Draggable d = (Draggable) c;
            if ( !d.isDraggable() ) return;
            
            d.setAnchorPoint( e.getPoint() );
        }
        
        public void mouseDragged(MouseEvent e) {
            Component c = (Component) e.getSource();
            if ( !(c instanceof Draggable) ) return;
            
            Draggable d = (Draggable) c;
            if ( !d.isDraggable() ) return;
            
            Dimension compSize = c.getSize();
            Point anchor = d.getAnchorPoint();
            Point mousePoint = e.getPoint();
            Point location = c.getLocation();
            Dimension parentSize = GlassPane.this.getSize();
            
            int x = location.x + (mousePoint.x - anchor.x);
            int y = location.y + (mousePoint.y - anchor.y);
            
            if ( x < 0 )
                x = 0;
            else if ( x > parentSize.width - compSize.width )
                x = parentSize.width - compSize.width;
            
            if ( y < 0 )
                y = 0;
            else if ( y > parentSize.height - compSize.height )
                y = parentSize.height - compSize.height;
            
            c.setLocation(x, y);
            
            if ( c instanceof JComponent ) {
                ((JComponent) c).putClientProperty(MOVED_FLAG, true);
            }
        }
        
    }
    //</editor-fold>
    
}
