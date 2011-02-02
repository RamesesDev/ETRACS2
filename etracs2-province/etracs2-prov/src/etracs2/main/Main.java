package etracs2.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;

public class Main {
    
    public static void main(String[] args) throws Exception {
        Map map = new HashMap();
        map.put("default.host", "localhost:8080");
        map.put("app.context", "bohol");
        OsirisTestPlatform.runTest(map);
    }
}
