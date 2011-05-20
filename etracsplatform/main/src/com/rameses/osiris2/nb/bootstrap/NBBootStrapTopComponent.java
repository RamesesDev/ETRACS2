package com.rameses.osiris2.nb.bootstrap;

import com.rameses.osiris2.nb.NBManager;
import com.rameses.osiris2.nb.windows.StartupWindow;
import com.rameses.platform.interfaces.ViewContext;
import java.awt.Component;
import java.io.Serializable;
import org.openide.ErrorManager;
import org.openide.util.NbBundle;
import org.openide.windows.TopComponent;
import org.openide.windows.WindowManager;



final class NBBootStrapTopComponent extends TopComponent implements StartupWindow {
    
    private static NBBootStrapTopComponent instance;
    private static final String PREFERRED_ID = "NBBootStrapTopComponent";
    
    private NBBootStrapTopComponent() {
        initComponents();
        setName(NbBundle.getMessage(NBBootStrapTopComponent.class, "CTL_NBBootStrapTopComponent"));
        //setToolTipText(NbBundle.getMessage(NBBootStrapTopComponent.class, "HINT_NBBootStrapTopComponent"));
        setDisplayName("Startup");
    }
    
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {

        setLayout(new java.awt.BorderLayout());

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
    
    
    public static synchronized NBBootStrapTopComponent getDefault() {
        if (instance == null) {
            instance = new NBBootStrapTopComponent();
        }
        return instance;
    }
    
    public static synchronized NBBootStrapTopComponent findInstance() {
        TopComponent win = WindowManager.getDefault().findTopComponent(PREFERRED_ID);
        if (win == null) {
            ErrorManager.getDefault().log(ErrorManager.WARNING, "Cannot find NBBootStrap component. It will not be located properly in the window system.");
            return getDefault();
        }
        if (win instanceof NBBootStrapTopComponent) {
            return (NBBootStrapTopComponent)win;
        }
        ErrorManager.getDefault().log(ErrorManager.WARNING, "There seem to be multiple components with the '" + PREFERRED_ID + "' ID. That is a potential source of errors and unexpected behavior.");
        return getDefault();
    }
    
    public int getPersistenceType() {
        return TopComponent.PERSISTENCE_NEVER;
    }
    
    public void componentOpened() {
        start();
    }
    
    public void componentClosed() {}
    
    public Object writeReplace() {
        return new ResolvableHelper();
    }
    
    protected String preferredID() {
        return PREFERRED_ID;
    }
    
    public boolean canClose() {
        return false;
    }
    
    public void start() {
        NBManager.getInstance().init(this);
        add( new DownloadPanel() );
    }
    
    protected void addImpl(Component comp, Object constraints, int index) {
        super.addImpl(comp, constraints, index);
        if ( comp instanceof ViewContext ) {
            ((ViewContext) comp).display();
        }
    }
    
    final static class ResolvableHelper implements Serializable {
        private static final long serialVersionUID = 1L;
        public Object readResolve() {
            return NBBootStrapTopComponent.getDefault();
        }
    }
    
}
