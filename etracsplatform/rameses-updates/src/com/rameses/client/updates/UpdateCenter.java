/*
 * UpdateCenter.java
 *
 * Created on November 24, 2009, 9:00 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.client.updates;

import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author elmo
 */
public class UpdateCenter {
    
    private String appurl;
    private String appPath = System.getProperty("user.dir")+"/osiris2";
    private Map env;
    private URL[] urls;
    
    public UpdateCenter(String appurl) {
        this.appurl = appurl;
    }
    
    public void setAppPath(String appPath) {
        this.appPath = appPath;
    }
    
    public String getAppPath() {
        return appPath;
    }
    
    public void start() throws Exception 
    {
        System.out.println("starting update");
        String hostPath = UpdateCenterUtil.buildHostPath( appurl );

        UpdateConf conf = UpdateCenterUtil.getUpdateConf(appurl, appPath );
        
        //compare the modules with old list, whatever is remaining should be deleted
        List<String> oldList = UpdateCenterUtil.getExistingFiles( conf.getModulePath() );
        List<ModuleEntry> forDownload = new ArrayList();
        for(ModuleEntry me: conf.getModules() ) {
            String fileName = me.getFilename();
            boolean existing = oldList.remove(fileName);
            if(!existing) forDownload.add( me ); 
        }
        
        //delete all files that are not used anymore.
        for( String s : oldList ) {
            File ff = new File( conf.getModulePath() + s );
            ff.delete();
        }
        
        //download all new modules
        for(ModuleEntry me : forDownload) {
            System.out.println("... updating " + me.getFilename() );
            UpdateCenterUtil.download( hostPath, me );
        }
        
        env = conf.getEnv();
        urls = new URL[conf.getModules().size()];
        int i = 0;
        for(ModuleEntry me: conf.getModules()) {
            urls[i++] = me.getURL();
        }
    }
    
    public ClassLoader getClassLoader( ClassLoader loader ) {
        if( urls == null ) {
            return loader;
        } else {
            return  new URLClassLoader(urls, loader);
        }
    }
    
    public Map getEnv() {
        return env;
    }
    
    
}
