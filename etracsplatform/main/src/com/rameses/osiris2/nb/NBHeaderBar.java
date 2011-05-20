package com.rameses.osiris2.nb;

import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.LayoutManager;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.net.URL;
import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;

public class NBHeaderBar extends JLayeredPane {
    
    private Logo logo;
    private Layout layout;
    
    
    public NBHeaderBar() {
        layout = new Layout();
        setLayout(layout);
        
        logo = new Logo();
//        URL u = getClass().getResource("/com/rameses/osiris2/nb/icons/osiris2.png");
//        logo.setIcon(new ImageIcon(u));
        add(logo, PALETTE_LAYER);
        layout.jcLogo = logo;
    }

    public void removeAll() {
        for(Component c : getComponents()) {
            if( c == logo ) continue;
            super.remove(c);
        }
    }
    
    public void setTopView(JComponent top) {
        if ( layout.jcHeader != null ) {
            remove(layout.jcHeader);
        }
        if(top!=null){
            add(top, DEFAULT_LAYER);
            layout.jcHeader = top;
        }
        SwingUtilities.updateComponentTreeUI(this);
    }
    
    public void setBottomView(JComponent bottom) {
        if ( layout.jcFooter != null ) {
            remove(layout.jcFooter);
        }
        if(bottom!=null) {
            add(bottom, DEFAULT_LAYER);
            layout.jcFooter = bottom;
        }
        SwingUtilities.updateComponentTreeUI(this);
    }
    
    public void setLogoIcon(ImageIcon logoIcon) {
        logo.setIcon(logoIcon);
    }
    
    
    //<editor-fold defaultstate="collapsed" desc=" Logo (Class) ">
    private class Logo extends JLabel {
        Logo() {
            setVerticalAlignment(SwingConstants.TOP);
            addMouseListener(new MouseListener() {
                public void mouseClicked(MouseEvent e) {
                    e.consume();
                }
                public void mouseEntered(MouseEvent e) {
                    e.consume();
                }
                public void mouseExited(MouseEvent e) {
                }
                public void mousePressed(MouseEvent e) {
                    e.consume();
                }
                public void mouseReleased(MouseEvent e) {
                    e.consume();
                }
            });
        }
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc=" Layout (Class) ">
    private class Layout implements LayoutManager {
        private Component jcHeader = null;
        private Component jcFooter = null;
        private Component jcLogo = null;
        
        public void addLayoutComponent(String name, Component comp) {
            if ("header".equals(name))
                this.jcHeader = comp;
            else if ("footer".equals(name))
                this.jcFooter = comp;
            else if ("logo".equals(name))
                this.jcLogo = comp;
        }
        
        public void removeLayoutComponent(Component comp) {
            if (jcHeader == comp) jcHeader = null;
            else if (jcFooter == comp) jcFooter = null;
            else if (jcLogo == comp) jcLogo = null;
        }
        
        public Dimension preferredLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }
        
        public Dimension minimumLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }
        
        public void layoutContainer(Container parent) {
            synchronized (parent.getTreeLock()) {
                Insets margin = parent.getInsets();
                int x = margin.left;
                int y = margin.top;
                int w = parent.getWidth() - (margin.left + margin.right);
                int h = parent.getHeight() - (margin.top + margin.bottom);
                
                if (jcLogo != null) {
                    Dimension dim = jcLogo.getPreferredSize();
                    jcLogo.setBounds(w-dim.width, y, dim.width, dim.height);
                }
                
                if (jcHeader instanceof JComponent) {
                    hideIfEmpty( (JComponent)jcHeader );
                }
                
                if (jcHeader != null && jcHeader.isVisible() ) {
                    Dimension dim = jcHeader.getPreferredSize();
                    jcHeader.setBounds(x, y, w, dim.height);
                    y += dim.height;
                }
                
                if (jcFooter instanceof JComponent) {
                    hideIfEmpty( (JComponent)jcFooter );
                }
                
                if (jcFooter != null && jcFooter.isVisible()) {
                    Dimension dim = jcFooter.getPreferredSize();
                    jcFooter.setBounds(x, y, w, dim.height);
                }
            }
        }
        
        public Dimension getLayoutSize(Container parent) {
            synchronized (parent.getTreeLock()) {
                int w=0, h=0;
                
                if (jcHeader instanceof JComponent) {
                    hideIfEmpty( (JComponent)jcHeader );
                }
                
                if (jcHeader != null && jcHeader.isVisible()) {
                    Dimension dim = jcHeader.getPreferredSize();
                    w = dim.width;
                    h = dim.height;
                }
                
                if (jcFooter instanceof JComponent) {
                    hideIfEmpty( (JComponent)jcFooter );
                }
                
                if (jcFooter != null && jcFooter.isVisible()) {
                    Dimension dim = jcFooter.getPreferredSize();
                    if (w == 0)
                        w = dim.width;
                    else
                        w = Math.min(w, dim.width);
                    
                    h += dim.height;
                }
                
                if (jcLogo != null) {
                    Dimension dim = jcLogo.getPreferredSize();
                    if (w == 0 && h == 0) {
                        w = dim.width;
                        h = dim.height;
                    }
                }
                
                Insets margin = parent.getInsets();
                w += (margin.left + margin.right);
                h += (margin.top + margin.bottom);
                return new Dimension(w, h);
            }
        }
        
        private void hideIfEmpty(JComponent jc) {
            if ( jc.getComponentCount() == 0 )
                jc.setVisible(false);
            else
                jc.setVisible(true);
        }
    }
    //</editor-fold>
    
}
