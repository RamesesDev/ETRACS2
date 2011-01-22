/*
 * NBPlatformLoader.java
 *
 * Created on October 28, 2010, 2:28 PM
 * @author jaycverg
 */

package com.rameses.osiris2.nb;

import com.rameses.client.updates.UpdateCenter;
import com.rameses.platform.interfaces.AppLoader;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;


public class NBPlatformLoader {
    
    public static DownloadResult download() throws Exception {
        String filename = System.getProperty("user.dir") + "/client.conf";
        File f = new File(filename);
        if (!f.exists())
            throw new Exception("client.conf does not exist");
        
        Properties props = new Properties();
        props.load(new FileInputStream(f));
        
        String appsys = (String) props.get("app.url");
        if (appsys == null || appsys.trim().length() == 0)
            throw new NullPointerException("app.url must be provided");
        
        UpdateCenter updateCenter = new UpdateCenter(appsys);
        updateCenter.start();
        
        Map env = new HashMap(props);
        env.putAll(updateCenter.getEnv());
        
        Iterator keys = env.keySet().iterator();
        
        ClassLoader classLoader = updateCenter.getClassLoader( NBManager.originalClassLoader() );
        
        String apploader = (String) env.get("app.loader");
        if (apploader == null || apploader.trim().length() == 0)
            throw new NullPointerException("app.loader must be provided in the ENV");
        
        AppLoader ap = (AppLoader) classLoader.loadClass(apploader).newInstance();
        return new DownloadResult(ap, env, classLoader);
    }
    
    public static class DownloadResult {
        
        private AppLoader appLoader;
        private Map env;
        private ClassLoader classLoader;
        
        DownloadResult(AppLoader loader, Map env, ClassLoader cl) {
            this.appLoader = loader;
            this.env = env;
            this.classLoader = cl;
        }
        
        public AppLoader getAppLoader() {
            return appLoader;
        }
        
        public Map getEnv() {
            return env;
        }
        
        public ClassLoader getClassLoader() {
            return classLoader;
        }
        
    }
    
}
