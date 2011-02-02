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
import java.util.HashMap;
import java.util.Map;


public class Main {
    
    public static void main(String[] args) throws Exception {
        Map conf = new HashMap();
        conf.put("default.host", "10.0.0.110:8080");
        conf.put("app.context", "loon");
        OsirisTestPlatform.runTest( conf );
    }
}
