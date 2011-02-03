package etracs2.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

public class Main {
    
    public static void main(String[] args) throws Exception {
        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        Map map = new HashMap();
        map.put("default.host", "10.0.0.108:8080");
        map.put("app.context", "bohol");
        OsirisTestPlatform.runTest(map);
    }
}
