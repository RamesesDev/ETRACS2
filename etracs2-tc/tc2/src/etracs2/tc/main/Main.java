/*
 * Main.java
 *
 * Created on February 27, 2011, 12:23 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package etracs2.tc.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

/**
 *
 * @author jzamss
 */
public class Main {
    
    /** Creates a new instance of Main */
    public Main() {
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        Map params = new HashMap();
        params.put("default.host", "localhost:8080");
        params.put("app.context", "bohol");
        OsirisTestPlatform.runTest( params );
    }
    
}
