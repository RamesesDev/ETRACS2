package com.rameses.osiris2.nb;

import com.rameses.osiris2.nb.windows.GlassPane;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Insets;
import java.awt.LayoutManager;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;
import java.awt.event.ContainerEvent;
import java.awt.event.ContainerListener;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLayeredPane;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JRootPane;
import javax.swing.SwingUtilities;

public class MainWindowCustomizer 
{
    public static void customize(JFrame frame)
    {
        MainWindowCustomizer mc = new MainWindowCustomizer();
        mc.customizeImpl(frame);
    }
    
    private JFrame frame;
    
    private MainWindowCustomizer() {}
    
    private void customizeImpl(final JFrame frame)
    {
        this.frame = frame;
        
        JRootPane rootPane = frame.getRootPane();
        JLayeredPane layeredPane = rootPane.getLayeredPane();
        
        Container contentPane = rootPane.getContentPane();
        contentPane.addContainerListener(new ContentPaneHandler(contentPane)); 
        
        LayerContainerHandler lch = new LayerContainerHandler();
        lch.rootPane = rootPane;
        layeredPane.addContainerListener(lch);
        
        frame.setGlassPane(new GlassPane());
    }
    
    //<editor-fold defaultstate="collapsed" desc=" ContentPaneHandler (Class) ">
    private class ContentPaneHandler implements ContainerListener
    {        
        private JComponent container;
        
        ContentPaneHandler(Container container) {
            this.container = (JComponent) container;
        }
        
        public void componentRemoved(ContainerEvent e) {}
        
        public void componentAdded(ContainerEvent e) 
        {
            Component c = e.getChild();
            if (c.getClass().getName().indexOf("Toolbar") >= 0) 
            {
                Container toolbar = (Container) c;
                toolbar.setLayout(new ToolbarPanelLayout());
                NBManager.getInstance().setToolbarView(toolbar); 
            }
            else if (c instanceof JPanel)
            {
                if (c.getName() == null || "".equals(c.getName()))
                {
                    //body component
                    initBody((JComponent) c);
                }
                else if ("statusLine".equals(c.getName()))
                {
                    //statusLine component
                    initStatus((JComponent) c);
                }
            }
        }
        
        private void initBody(JComponent body)
        {
        }
        
        private void initStatus(JComponent comp)
        {
            comp.setLayout(new StatusbarLayout()); 
            NBManager.getInstance().setStatusView(comp);
        }
    }
    //</editor-fold>            
    
    //<editor-fold defaultstate="collapsed" desc=" LayerContainerHandler (Class) ">
    private class LayerContainerHandler implements ContainerListener
    {
        Object treeLocked = new Object();
        JRootPane rootPane;
        boolean processed;
        
        public void componentRemoved(ContainerEvent e) {}
        
        public void componentAdded(ContainerEvent e) 
        {
            if (processed) return;
            
            if (e.getChild() instanceof JMenuBar)
            {
                synchronized (treeLocked)
                {
                    JMenuBar mbar = (JMenuBar) e.getChild();
                    NBManager.getInstance().setMenubar(mbar);

                    mbar.setVisible(false);
                    
                    Map nbmenus = new HashMap();
                    for (int i=0; i<mbar.getMenuCount(); i++)
                    {
                        JMenu jm = mbar.getMenu(i);           
                        jm.setEnabled(false);
                        jm.setVisible(false);
                        
                        for (int ii=0; ii<jm.getMenuComponentCount(); ii++)
                        {
                            Component jmic = jm.getMenuComponent(ii);
                            if (jmic instanceof JMenuItem)
                            {
                                JMenuItem jmi = (JMenuItem) jmic;
                                String jmitext = jmi.getText()+"";
                                nbmenus.put(jmitext, jmi);
                            }
                        }
                    }
                    
                    frame.getRootPane().putClientProperty("NBMenus", nbmenus);
                    processed = true;
                }
            }
        }
        
        private JMenuItem find(JMenu menu, String text)
        {
            Component[] comps = menu.getMenuComponents(); 
            for (int i=0; i<comps.length; i++)
            {
                if (!(comps[i] instanceof JMenuItem)) continue;
                
                JMenuItem jmi = (JMenuItem) comps[i];
                String s = jmi.getText()+"";
                if (s.trim().equalsIgnoreCase(text))
                    return jmi;
            }
            return null;
        }
        
        private JMenuItem find(JMenuBar mbar, String text)
        {
            for (int i=0; i<mbar.getMenuCount(); i++)
            {
                JMenu jm = mbar.getMenu(i);
                JMenuItem c = find(jm, text);
                if (c != null) return c;
            }
            return null;
        }        
    }
    //</editor-fold>    
        
    //<editor-fold defaultstate="collapsed" desc=" ComponentHandler (Class) ">
    private class ComponentHandler implements ComponentListener
    {
        public void componentMoved(ComponentEvent e) {}
        public void componentResized(ComponentEvent e) {}
        
        public void componentHidden(ComponentEvent e) 
        {
            if (frame.getJMenuBar() != null)
                frame.getJMenuBar().setVisible(true);
        }
        
        public void componentShown(ComponentEvent e) 
        {
            SwingUtilities.invokeLater(new Runnable() 
            {
                public void run() 
                {
                    if (frame.getJMenuBar() != null)
                        frame.getJMenuBar().setVisible(false);
                    else
                        SwingUtilities.invokeLater(this);
                }
            });
        }
    }
    //</editor-fold>    
            
    //<editor-fold defaultstate="collapsed" desc=" ToolbarPanelLayout (Class) ">
    private class ToolbarPanelLayout implements LayoutManager
    {
        public void addLayoutComponent(String name, Component comp) {}
        public void removeLayoutComponent(Component comp) {}

        public Dimension preferredLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }

        public Dimension minimumLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }

        public void layoutContainer(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                Insets margin = parent.getInsets();
                int x = margin.left;
                int y = margin.top;
                int w = parent.getWidth() - (margin.left + margin.right);
                int h = parent.getHeight() - (margin.top + margin.bottom);
                
                Component baseComp = null;
                Component[] comps = parent.getComponents();
                for (int i=0; i<comps.length; i++)
                {
                    String name = comps[i].getName()+"";
                    if ("toolbarpanel".equalsIgnoreCase(name)) {
                        baseComp = comps[i];
                    } else {
                        comps[i].setBounds(0, 0, 0, 0); 
                    }
                }
                
                if (baseComp != null)
                    baseComp.setBounds(x, y, w, h);
            }
        }

        public Dimension getLayoutSize(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                int w=0, h=0;
                Component baseComp = null;
                Component[] comps = parent.getComponents();
                for (int i=0; i<comps.length; i++)
                {
                    String name = comps[i].getName()+"";
                    if ("toolbarpanel".equalsIgnoreCase(name)) {
                        baseComp = comps[i];
                    } else {
                        comps[i].setBounds(0, 0, 0, 0);
                    }
                }
                
                if (baseComp != null)
                {
                    Dimension dim = baseComp.getPreferredSize(); 
                    w = dim.width;
                    h = dim.height;
                }
                
                Insets margin = parent.getInsets();
                w += (margin.left + margin.right);
                h += (margin.top + margin.bottom);
                return new Dimension(w, h);
            }
        }
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc=" ToolbarLayout (Class) ">
    private class ToolbarLayout implements LayoutManager
    {
        public void addLayoutComponent(String name, Component comp) {}
        public void removeLayoutComponent(Component comp) {}

        public Dimension preferredLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }

        public Dimension minimumLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }

        public void layoutContainer(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                Insets margin = parent.getInsets();
                int x = margin.left;
                int y = margin.top;
                int w = parent.getWidth() - (margin.left + margin.right);
                int h = parent.getHeight() - (margin.top + margin.bottom);
                
                Component[] comps = parent.getComponents();
                for (int i=0; i<comps.length; i++)
                {
                    Dimension dim = comps[i].getPreferredSize();
                    comps[i].setBounds(x, y, dim.width, h);
                    x += dim.width; 
                }
            }
        }

        public Dimension getLayoutSize(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                int w=0, h=0;
                Component[] comps = parent.getComponents();
                for (int i=0; i<comps.length; i++)
                {
                    Dimension dim = comps[i].getPreferredSize();
                    w += dim.width;
                    h = Math.max(h, dim.height); 
                }
                
                Insets margin = parent.getInsets();
                w += (margin.left + margin.right);
                h += (margin.top + margin.bottom);
                return new Dimension(w, h);
            }
        }
    }
    //</editor-fold>    
    
    //<editor-fold defaultstate="collapsed" desc=" StatusbarLayout (Class) ">
    private class StatusbarLayout implements LayoutManager
    {
        public void addLayoutComponent(String name, Component comp) {}
        public void removeLayoutComponent(Component comp) {}

        public Dimension preferredLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }

        public Dimension minimumLayoutSize(Container parent) {
            return getLayoutSize(parent);
        }
        
        private Component getComponent(Component[] comps)
        {
            for (int i=0; i<comps.length; i++)
            {
                if ("statuspanel".equals(comps[i].getName())) 
                    return comps[i]; 
            }
            return null; 
        }

        public void layoutContainer(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                Component c = getComponent(parent.getComponents()); 
                if (c != null && c.isVisible())
                {
                    Insets margin = parent.getInsets();
                    int x = margin.left;
                    int y = margin.top;
                    int w = parent.getWidth() - (margin.left + margin.right);
                    int h = parent.getHeight() - (margin.top + margin.bottom);
                    
                    Dimension dim = c.getPreferredSize();
                    c.setBounds(x, y, w, dim.height);
                }
            }
        }

        public Dimension getLayoutSize(Container parent) 
        {
            synchronized (parent.getTreeLock())
            {
                int w=0, h=0;
                Component c = getComponent(parent.getComponents()); 
                if (c != null && c.isVisible())
                {
                    Dimension dim = c.getPreferredSize();
                    w = dim.width;
                    h = dim.height; 
                    
                    Insets margin = parent.getInsets();
                    w += (margin.left + margin.right);
                    h += (margin.top + margin.bottom);
                }                
                return new Dimension(w, h);
            }
        }
    }
    //</editor-fold>        
    
}
