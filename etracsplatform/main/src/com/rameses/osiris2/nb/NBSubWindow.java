package com.rameses.osiris2.nb;

import com.rameses.platform.interfaces.SubWindow;
import com.rameses.platform.interfaces.ViewContext;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JComponent;
import javax.swing.KeyStroke;
import javax.swing.SwingUtilities;
import org.openide.windows.TopComponent;

public class NBSubWindow extends TopComponent implements SubWindow 
{
    private NBPlatform nbPlatform;
    private NBMainWindow mainWindow;
    private String preferredID;
    private boolean closeable = true;
    private boolean bypassVerifyClose;
    
    public NBSubWindow(NBPlatform nbPlatform, NBMainWindow mainWindow, String preferredID) 
    {
        this.nbPlatform = nbPlatform;
        this.mainWindow = mainWindow;
        this.preferredID = preferredID;
        setLayout(new BorderLayout());
        
        ActionListener closeAction = new ActionListener() {
            public void actionPerformed(ActionEvent e) { closeWindow(); }
        };
        registerKeyboardAction(closeAction, KeyStroke.getKeyStroke("ctrl W"), JComponent.WHEN_IN_FOCUSED_WINDOW);
    }
    
    public void setCloseable(boolean closeable) 
    { 
        this.closeable = closeable; 
    }
    
    protected String preferredID() { return preferredID; }
    
    public int getPersistenceType() { return PERSISTENCE_NEVER; }
    
    public void open() 
    {
        super.open();
        
        if (getViewContext() == null) return;
        
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                getViewContext().display();
            }
        });
    }
    
    public boolean canClose() 
    {
        if (!closeable) return false;
        if (!bypassVerifyClose) 
        {
            ViewContext vc = getViewContext();
            if (vc != null) return vc.close();
        }
        return true;
    }
    
    protected void componentClosed() 
    {
        super.componentClosed();
        nbPlatform.removeWindow(preferredID);
    }
    
    public void closeWindow() 
    {
        if (canClose()) 
        {
            try 
            {
                bypassVerifyClose = true;
                close();
            } 
            catch(RuntimeException rex) { 
                throw rex; 
            } 
            catch(Exception ex) {
                throw new RuntimeException(ex.getMessage(), ex);
            } 
            finally {
                bypassVerifyClose = false;
            }
        }
    }
    
    private ViewContext getViewContext() 
    {
        Component c = getComponent(0);
        if (c instanceof ViewContext) {
            ViewContext vc = (ViewContext) c;
            if ( vc.getSubWindow() == null ) vc.setSubWindow(this);
            return vc;
        }
        return null;
    }

    public void setTitle(String title) {
        setDisplayName(title);
    }
}
