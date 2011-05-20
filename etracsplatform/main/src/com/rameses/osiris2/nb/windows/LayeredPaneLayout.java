/*
 * LayeredPaneLayout.java
 *
 * Created on December 14, 2010, 10:40 AM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.LayoutManager2;
import java.awt.Rectangle;
import java.util.List;
import java.util.Vector;
import javax.swing.JLayeredPane;

public class LayeredPaneLayout implements LayoutManager2 {
    
    private Component defaultLayer;
    private Component modalLayer;
    private List<Component> otherLayers = new Vector();
    
    
    public LayeredPaneLayout() {
    }
    
    public void addLayoutComponent(String name, Component comp) {}
    public void invalidateLayout(Container target) {}
    
    public float getLayoutAlignmentX(Container target) { return 0f; }
    public float getLayoutAlignmentY(Container target) { return 0f; }
    
    public Dimension maximumLayoutSize(Container target) {
        return new Dimension(100,100);
    }
    public Dimension minimumLayoutSize(Container parent) {
        return new Dimension(100,100);
    }
    
    public Dimension preferredLayoutSize(Container parent) {
        synchronized ( parent.getTreeLock() ) {
            int w=0, h=0;
            Insets margin = parent.getInsets();
            if ( defaultLayer != null ) {
                Dimension d = defaultLayer.getPreferredSize();
                w = Math.max(w, d.width);
                h = Math.max(h, d.height);
            }
            if ( modalLayer != null ) {
                Dimension d = modalLayer.getPreferredSize();
                w = Math.max(w, d.width);
                h = Math.max(h, d.height);
            }
            w += margin.left + margin.right;
            h += margin.top + margin.bottom;
            return new Dimension(w, h);
        }
    }
    
    public void addLayoutComponent(Component comp, Object constraints) {
        if ( constraints == null || constraints.equals(JLayeredPane.DEFAULT_LAYER))
            defaultLayer = comp;
        else if ( constraints.equals(JLayeredPane.MODAL_LAYER) )
            modalLayer = comp;
        else
            otherLayers.add( comp );
    }
    
    public void removeLayoutComponent(Component comp) {
        if ( comp == null );
        else if ( comp.equals(defaultLayer) )
            defaultLayer = null;
        else if ( comp.equals(modalLayer) )
            modalLayer = null;
        else
            otherLayers.remove(comp);
    }
    
    public void layoutContainer(Container parent) {
        synchronized ( parent.getTreeLock() ) {
            if ( defaultLayer != null ) {
                Insets margin = parent.getInsets();
                Dimension d = parent.getSize();
                int width = d.width - margin.left - margin.right;
                int height = d.height - margin.top - margin.bottom;
                defaultLayer.setBounds(margin.left, margin.top, width, height);
            }
            if ( modalLayer != null ) {
                Insets margin = parent.getInsets();
                Dimension d = parent.getSize();
                int width = d.width - margin.left - margin.right;
                int height = d.height - margin.top - margin.bottom;
                modalLayer.setBounds(margin.left, margin.top, width, height);
            }
            for(Component comp : otherLayers) {
                Rectangle bounds = comp.getBounds();
                if ( bounds.width == 0 || bounds.height == 0 ) {
                    Dimension d = comp.getPreferredSize();
                    comp.setBounds(10, 10, d.width, d.height);
                }
            }
        }
    }
    
}
