/*
 * Main.java
 * Created on January 20, 2011, 10:57 AM
 *
 * Rameses Systems Inc
 * www.ramesesinc.com
 *
 */

package etracs2.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import com.rameses.rcp.common.PageListModel;
import com.rameses.rcp.common.Task;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;


public class Main {
    
    public static void main(String[] args) throws Exception {

        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());

        Map conf = new HashMap();
        
        conf.put("default.host", "localhost:8080");
        conf.put("app.context", "loon");
        
        OsirisTestPlatform.runTest( conf );
        
    }
}
