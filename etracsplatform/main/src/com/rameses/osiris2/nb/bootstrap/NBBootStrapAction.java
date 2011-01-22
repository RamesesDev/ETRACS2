package com.rameses.osiris2.nb.bootstrap;

import java.awt.event.ActionEvent;
import javax.swing.AbstractAction;
import javax.swing.ImageIcon;
import org.openide.util.NbBundle;
import org.openide.util.Utilities;
import org.openide.windows.TopComponent;

/**
 * Action which shows NBBootStrap component.
 */
public class NBBootStrapAction extends AbstractAction {
    
    public NBBootStrapAction() {
        super(NbBundle.getMessage(NBBootStrapAction.class, "CTL_NBBootStrapAction"));
//        putValue(SMALL_ICON, new ImageIcon(Utilities.loadImage(NBBootStrapTopComponent.ICON_PATH, true)));
    }
    
    public void actionPerformed(ActionEvent evt) {
        TopComponent win = NBBootStrapTopComponent.findInstance();
        win.setDisplayName("Downloading...");
        win.open();
        win.requestActive();
    }
    
}
