/*
 * NBStartupRunnable.java
 *
 * Created on October 30, 2010, 10:18 AM
 * @author jaycverg
 */

package com.rameses.osiris2.nb;

import com.rameses.osiris2.nb.bootstrap.ErrorPanel;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

public class NBStartupRunnable implements Runnable {
    

    public NBStartupRunnable() {}
    
    public void run() {
        NBPlatform platform = NBManager.getInstance().getPlatform();
        try {
            NBPlatformLoader.DownloadResult downloadResult = NBPlatformLoader.download();
            Map env = downloadResult.getEnv();
            
            try {
                String plaf = (String) env.get("plaf");
                if (plaf != null && plaf.trim().length() > 0) {
                    UIManager.setLookAndFeel(plaf);
                } else if (System.getProperty("os.name","").toLowerCase().indexOf("windows") >= 0) {
                    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
                } else {
                    //plaf = "com.jgoodies.plaf.plastic.PlasticXPLookAndFeel";
                }
            } catch(Exception ign) {;}

            
            downloadResult.getAppLoader().load( downloadResult.getClassLoader(), env, platform);
            
            
        } catch(Exception e) {
            Map m =  new HashMap();
            m.put("title", "Download Error");
            platform.showStartupWindow(null, new ErrorPanel( e.getMessage() ), m);
            e.printStackTrace();
        }
    }
    
}
