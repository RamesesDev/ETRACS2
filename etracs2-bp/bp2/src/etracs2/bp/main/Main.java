package etracs2.bp.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

/**
 *
 * @author jzamora
 */
public class Main {
    
    /** Creates a new instance of Main */
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
