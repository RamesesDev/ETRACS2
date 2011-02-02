/*
 * Main.java
 *
 * Created on January 24, 2011, 9:28 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package etracs2faasreport;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author rameses : donie
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
        params.put("default.host","10.0.0.108:8080");
        params.put("app.context","bohol");
        OsirisTestPlatform.runTest(params);
    }
    
}
