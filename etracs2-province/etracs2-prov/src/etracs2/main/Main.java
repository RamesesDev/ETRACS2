package etracs2.main;

import com.rameses.osiris2.client.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;
<<<<<<< HEAD:etracs2-province/etracs2-prov/src/etracs2/main/Main.java
=======
import javax.swing.LookAndFeel;
>>>>>>> 96b5f8a3ada889cbfeee20af44baf54bc840e769:etracs2-province/etracs2-prov/src/etracs2/main/Main.java
import javax.swing.UIManager;

public class Main {
    
    public static void main(String[] args) throws Exception {
<<<<<<< HEAD:etracs2-province/etracs2-prov/src/etracs2/main/Main.java
        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        Map map = new HashMap();
        map.put("default.host", "10.0.0.108:8080");
=======
        LookAndFeel l = UIManager.getLookAndFeel();
        try{
            UIManager.setLookAndFeel( UIManager.getSystemLookAndFeelClassName() );
        }catch(Exception ign){
            UIManager.setLookAndFeel( l );
        }
        Map map = new HashMap();
        map.put("default.host", "10.0.0.108:8080");

>>>>>>> 96b5f8a3ada889cbfeee20af44baf54bc840e769:etracs2-province/etracs2-prov/src/etracs2/main/Main.java
        map.put("app.context", "bohol");
        OsirisTestPlatform.runTest(map);
    }
}
