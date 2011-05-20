/*
 * NBPopup.java
 *
 * Created on July 17, 2010, 3:07 PM
 * @author jaycverg
 */

package com.rameses.osiris2.nb.windows;

import com.rameses.osiris2.nb.*;
import com.rameses.platform.interfaces.SubWindow;
import com.rameses.platform.interfaces.ViewContext;
import java.awt.Container;
import java.awt.Dialog;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.KeyStroke;


public class NBPopup extends JDialog implements SubWindow {
    
    private NBPlatform platform;
    private String id;
    private ViewContext viewContext;
    
    
    public NBPopup(NBPlatform platform, Frame parent, String id) {
        super(parent);
        init(platform, id);
    }
    
    public NBPopup(NBPlatform platform, Dialog parent, String id) {
        super(parent);
        init(platform, id);
    }
    
    private void init(NBPlatform platform, String id) {
        this.platform = platform;
        this.id = id;
        addWindowListener(new NBPopupAdapter());
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        
        EscAction esc = new EscAction();
        getRootPane().registerKeyboardAction(esc, esc.keyStroke, JComponent.WHEN_IN_FOCUSED_WINDOW);
    }

    public void setContentPane(Container contentPane) {
        super.setContentPane(contentPane);
        if ( contentPane instanceof ViewContext ) {
            viewContext = (ViewContext) contentPane;
        }
    }
        
    public void closeWindow() {
        if ( viewContext != null && !viewContext.close() ) return;
        
        this.dispose();
        platform.unregisterWindow(id);
    }
    
    
    private class NBPopupAdapter extends WindowAdapter {
        
        public void windowClosing(WindowEvent e) {
            closeWindow();
        }

        public void windowOpened(WindowEvent e) {
            if ( viewContext != null ) {
                viewContext.display();
            }
        }
                
    }
    
    private class EscAction implements ActionListener {
        
        KeyStroke keyStroke = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
        
        public void actionPerformed(ActionEvent e) {
            closeWindow();
        }
        
    }
}
