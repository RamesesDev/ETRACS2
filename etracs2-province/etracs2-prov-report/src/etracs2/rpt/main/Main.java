/*
 * Main.java
 *
 * Created on January 18, 2011, 5:49 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package etracs2.rpt.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

/**
 *
 * @author prmf
 */
public class Main {
    
    public static void main(String[] args) throws Exception{
        UIManager.setLookAndFeel( UIManager.getSystemLookAndFeelClassName() );
        Map map = new HashMap();
        
        map.put("default.host","10.0.0.155:8080");
        map.put("LGUNAME","PROVINCE OF BOHOL");
        map.put("LGULOGO", "http://10.0.0.155:8080/bohol-modules/images/lgu.png");
        map.put("ASSESOROFFICENAME", "OFFICE OF THE PROVINCIAL ASSESSOR");
        map.put("app.context", "bohol");
        
        OsirisTestPlatform.runTest(map);
        
    }
    
}
