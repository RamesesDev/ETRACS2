package com.rameses.client.updates;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;


public class UpdateConf extends DefaultHandler {
    
    private List<ModuleEntry> modules = new ArrayList<ModuleEntry>();
    private Map env = new HashMap();
    private StringBuffer sbuff = new StringBuffer();
    private String confPath;
    private long lastModified;
    
    private String appPath;
    private String appurl;
    private String modulePath;
    
    public UpdateConf(String appurl, String appPath, String confPath ) {
        this.appurl = appurl;
        this.appPath = appPath;
        this.confPath = confPath;
        this.modulePath = confPath.substring(0, confPath.lastIndexOf("/") + 1);
    }
    
    public void load() throws Exception {
        modules.clear();
        env.clear();
        
        File f = new File(confPath);
        if(!f.exists())
            throw new Exception(confPath + " does not exist!");
        
        lastModified = f.lastModified();
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        ByteArrayInputStream bis = null;
        try {
            fis = new FileInputStream(f);
            ois = new ObjectInputStream(fis);
            Object o = CipherUtil.decode((Serializable)ois.readObject());
            bis = new ByteArrayInputStream(o.toString().getBytes());
            SAXParser parser = SAXParserFactory.newInstance().newSAXParser();
            parser.parse(bis, this);
        } catch(Exception ex) {
            f.delete();
            throw ex;
        } finally {
            try { fis.close();  } catch(Exception ign){;}
            try { bis.close();  } catch(Exception ign){;}
        }
    }
    
    public void startElement(String string, String string0, String qName, Attributes attr) throws SAXException {
        if( qName.equals("module")) {
            String name = attr.getValue("file");
            if(name==null) {
                throw new IllegalStateException("module file must not be null");
            }
            String sz = attr.getValue("size");
            String version = attr.getValue("version");
            ModuleEntry me = new ModuleEntry(name,version,sz);
            me.setModulePath(modulePath);
            
            //ensure no double entry
            if( getModules().indexOf(me)<0 ) {
                getModules().add(me);
            }
        } else if( qName.equals("env")) {
            sbuff.delete(0, sbuff.length());
        }
    }
    
    
    private void populate(Map map, Attributes attr ){
        for( int i=0; i<attr.getLength();i++) {
            map.put( attr.getQName(i), attr.getValue(i) );
        }
    }
    
    public void characters(char[] c, int i, int i0) throws SAXException {
        sbuff.append(c, i, i0);
    }
    
    public void endElement(String string, String string0, String qName) throws SAXException {
        if(qName.equals("env")) {
            try {
                Properties props = new Properties();
                props.load(new ByteArrayInputStream(sbuff.toString().getBytes()));
                for( Object o : props.entrySet() ) {
                    Map.Entry me = (Map.Entry)o;
                    String key = (me.getKey()+"").trim();
                    String val = (me.getValue()+"").trim();
                    if( val.endsWith(";")) val = val.substring(0, val.length()-1);
                    env.put(key , val  );
                }
            } catch (Exception ign) {;}
        }
    }
    
    public List<ModuleEntry> getModules() {
        return modules;
    }
    
    public Map getEnv() {
        return env;
    }
    
    public long getLastModified() {
        return lastModified;
    }
    
    /*
    public void setHostPath(String hostPath) {
        this.hostPath = hostPath;
    }
     */
    
    public void setAppPath(String appPath) {
        this.appPath = appPath;
    }
    
    public String getModulePath() {
        return modulePath;
    }
    
}
