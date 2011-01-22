/*
 * UpdateManager.java
 *
 * Created on September 15, 2009, 3:04 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.client.updates;

import java.util.Hashtable;
import java.util.Map;

/**
 *
 * @author elmo
 */
public final class UpdateManager {
    
    private static UpdateManager instance;
    
    public static UpdateManager getInstance() {
        if( instance == null ) {
            instance = new UpdateManager();
        }
        return instance;
    }
    
    
    private Map<String,UpdateCenter> map = new Hashtable<String,UpdateCenter>();
    
    
    private UpdateManager() {
    }
    
    public UpdateCenter getUpdateCenter( String path ) {
        if( !map.containsKey(path) ) {
            map.put(path, new UpdateCenter(path) );
        }
        return map.get(path);
    }
    
    
}
