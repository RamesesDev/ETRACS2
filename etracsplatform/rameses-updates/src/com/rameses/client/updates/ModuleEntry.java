/*
 * ModuleEntry.java
 *
 * Created on November 24, 2009, 9:00 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.client.updates;

import java.io.File;
import java.net.URL;

/**
 *
 * @author elmo
 * States 
 *
 */
public class ModuleEntry {
    
    private String name;
    private double version = 0.0;
    private double size = 0.0;
    private String appPath;
    private String fileName;
    
    public ModuleEntry(String n, String v, String sz) {
        this.name = n;
        if(v!=null)this.version = Double.parseDouble(v);
        if(sz!=null) this.size = Double.parseDouble(sz);
         if(version==0.0) {
            fileName = name;
        }
        else {
            String vr = (version+"").replaceAll("\\.", "_");
            fileName = name.substring(0, name.lastIndexOf(".")) + "-" + vr + ".jar" ;
        }
    }

    public boolean equals(Object obj) {
        if(obj==null) return  false;
        if(!(obj instanceof ModuleEntry))return false;
        return name.equals(((ModuleEntry)obj).getName());
    }

    public String getName() {
        return name;
    }
    
    public String getModulePath() {
        return appPath;
    }

    public void setModulePath(String appPath) {
        this.appPath = appPath;
    }
    
    public URL getURL() throws Exception {
        //for counter measure, ensure that file exists!
        File f = new File(appPath+getFilename());
        return f.toURL();
    }
    
    public String getFilename() {
       return fileName;
    }
    
}
