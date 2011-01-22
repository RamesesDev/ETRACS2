/*
 * DownloadUtil.java
 *
 * Created on October 30, 2010, 5:36 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.client.updates;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ms
 */
public final class UpdateCenterUtil {
    
    //Based on the app.url value from the client.conf get the client path
    private static String buildConfFileName(String appurl, String appPath)  {
        //check malformed url first
        try {
            URL u = new URL(appurl);
        } catch (Exception e) {
            System.out.println("[URL-Error] " + e.getMessage());
        }
        
        int lastIndex = appurl.lastIndexOf("/");
        String appName = appurl.substring(appurl.lastIndexOf("/",lastIndex-1 )+1, lastIndex );
        
        if (!appPath.endsWith("/")) appPath = appPath + "/";
        
        appPath = appPath + appName;
        
        //create the directories
        File f = new File(appPath);
        if (!f.exists()) f.mkdirs();
        return appPath + "/update.sxml";
    }
    
    public static String buildHostPath(String appurl) {
        int lastIndex = appurl.lastIndexOf("/");
        String appName = appurl.substring(appurl.lastIndexOf("/",lastIndex-1 )+1, lastIndex );
        return appurl.substring(0, appurl.lastIndexOf("/")+1);
    }
    
    private static void persistConf( String appurl, String confFileName ) throws Exception {
        ObjectOutputStream oos = null;
        FileOutputStream fos = null;
        InputStream is = null;
        long lastModified = 0;
        File f = new File(confFileName);
        URLConnection uc = null;
        try {
            URL u = new URL(appurl);
            uc = u.openConnection();
            lastModified = uc.getLastModified();
            if(lastModified==0 && !f.exists())
                throw new Exception("System failed to find modules. Please check the connection to the download host");
            is = u.openStream();
            fos = new FileOutputStream(f);
            
            //check if it already ends with .sxml, copy the file directly do not encode anymore otherwise encrypt it
            if( !appurl.endsWith(".sxml") ) {
                StringBuffer sb = new StringBuffer();
                int i = 0;
                while((i=is.read())!=-1) {
                    sb.append((char)i);
                }
                Object o = CipherUtil.encode((Serializable)sb.toString());
                oos = new ObjectOutputStream(fos);
                oos.writeObject( o );
                oos.flush();
            }
            else {
                int i = 0;
                while((i=is.read())!=-1) {
                    fos.write( (byte)i );
                }
                fos.flush();
            }
            //impt to set the file timestamp
            f.setLastModified( lastModified );
        } catch(Exception e) {
            throw e;
        } finally {
            try { is.close(); } catch(Exception ign){;}
            try { oos.close(); } catch(Exception ign){;}
            try { fos.close(); } catch(Exception ign){;}
            closeURLConnection(uc);
        }
       
    }
    
    private static void closeURLConnection(URLConnection uc) {
        try {
            if(uc instanceof HttpURLConnection) {
                (( HttpURLConnection)uc).disconnect();
            }
        } catch(Exception ign){;}
    }
    
    //this returns null if there are no updatesappurl, appPath
    public static UpdateConf getUpdateConf(String appurl, String appPath) throws Exception {
        String confFileName = buildConfFileName(appurl, appPath );
        File f = new File(confFileName);
        File temp = new File(confFileName+"~");
        
        long lastModified = -1;
        if( f.exists() ) lastModified = f.lastModified();
        
        if( lastModified < 0 ) {
            persistConf( appurl, confFileName );
        } else {
            //check if there are changes. if there is no connection, dont force it.
            try {
                URL u = new URL(appurl);
                URLConnection uc = u.openConnection();
                long modified = uc.getLastModified();
                closeURLConnection( uc );
                if(modified != lastModified) {
                    persistConf( appurl, confFileName );
                }
            } catch(Exception ign){;}
        }
        UpdateConf uc =  new UpdateConf( appurl, appPath, confFileName );
        uc.load();
        return uc;
    }
    
    public static List<String> getExistingFiles(String modulePath) {
        List<String> list = new ArrayList();
        File f = new File(modulePath);
        for(String s: f.list() ) {
            if(s.endsWith(".jar")) list.add(s);
        }
        return list;
    }
    
    public static void download(String hostPath, ModuleEntry me) throws Exception {
        URLConnection uc = null;
        InputStream is = null;
        FileOutputStream fos = null;
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        File file = new File( me.getModulePath() + me.getFilename());
        try {
            int buffSize = 1024 * 32;
            
            fos = new FileOutputStream( file );
            bos = new BufferedOutputStream(fos, buffSize);
            
            URL u = new URL(hostPath  + me.getName());
            uc = u.openConnection();
            is = uc.getInputStream();
            bis = new BufferedInputStream(is, buffSize);
            
            byte[] buff = new byte[buffSize];
            int bytesRead = -1;
            
            while( (bytesRead = bis.read(buff)) != -1 ) {
                bos.write(buff, 0, bytesRead);
            }
            bos.flush();
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                if( uc instanceof HttpURLConnection ) {
                    ((HttpURLConnection)uc).disconnect();
                }
            } catch (Exception ign) {;}
            try { is.close(); } catch (Exception ign) {;}
            try { bis.close(); } catch (Exception ign) {;}
            try { fos.close(); } catch (Exception ign) {;}
            try { bos.close(); } catch (Exception ign) {;}
        }
    }
    
    
}
