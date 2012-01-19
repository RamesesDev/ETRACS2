/*
 * Main.java
 *
 * Created on June 1, 2011, 12:25 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package etracs2.rpt.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author prmf
 */
public class Main {
    
    /** Creates a new instance of Main */
    public Main() {
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        Map params = new HashMap();
        params.put("default.host", "localhost:8080");
        params.put("app.context", "malaybalay");
        OsirisTestPlatform.runTest( params );
    }
    
}
