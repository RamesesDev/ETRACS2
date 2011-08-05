package etracs2.bp.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import com.rameses.rcp.common.LookupModel;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.ImageObserver;
import java.awt.image.ImageProducer;
import java.util.HashMap;
import java.util.Map;
import javax.swing.ImageIcon;
import javax.swing.UIManager;

public class Main {
    
    public Main() {
    }
    
    public static void main(String[] args) throws Exception {
        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        Map params = new HashMap();
        params.put("default.host", "localhost:8080");
        params.put("app.context", "maribojoc");
        OsirisTestPlatform.runTest( params );
    }
    
}
