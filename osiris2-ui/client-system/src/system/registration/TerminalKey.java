package system.registration;
/*
 * TerminalKeyUtil.java
 *
 * Created on September 25, 2010, 4:40 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

import com.rameses.util.CipherUtil;
import com.rameses.util.MachineInfo;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ms
 */
public class TerminalKey implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private static String filename = ".terminal";
    private String terminalid;
    private String macaddress;
    
    public TerminalKey(Map map) {
        this.terminalid = (String)map.get("terminalid");
        this.macaddress = (String)map.get("macaddress");
    }
    
    public TerminalKey(String terminalid, String clientcode, String macaddress) {
        this.terminalid = terminalid;
        this.macaddress = macaddress;
    }
    
    public TerminalKey() {}
    
    public String getTerminalid() {
        return terminalid;
    }
    
    public String getMacaddress() {
        return macaddress;
    }
    
    public boolean validateMacaddress() throws Exception {
        return MachineInfo.getInstance().getMacAddress().equals( macaddress  );
    }
  
    public void save() throws Exception {
        if(terminalid==null || macaddress==null)
            throw new Exception("Error saving terminal key. Terminalid, clientcode and macaddress must not be null");
        
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        try {
            File f = new File(filename);
            Map map = new HashMap();
            map.put(  "terminalid", terminalid );
            map.put(  "macaddress", macaddress );
            Object o = CipherUtil.encode( (Serializable) map );
            fos = new FileOutputStream( f );
            oos = new ObjectOutputStream(fos);
            oos.writeObject( o );
            oos.flush();
        } catch(Exception e) {
            throw e;
        } finally {
            try { oos.close(); } catch(Exception ign){;}
            try { fos.close(); } catch(Exception ign){;}
        }
        
    }
    
    /**
     * returns false if file cannot be opened or there is a verification error.
     */
    public boolean open() throws Exception {
        FileInputStream fis = null;
        ObjectInputStream ois = null;
        File f = new File(filename);
        if(!f.exists()) return false;
        try {
            fis = new FileInputStream( f );
            ois = new ObjectInputStream( fis );
            Object o = ois.readObject();
            Map map = (Map)CipherUtil.decode( (Serializable)o );
            this.terminalid = (String)map.get("terminalid");
            this.macaddress = (String)map.get("macaddress");
        } catch(Exception e) {
            throw e;
        } finally {
            try { ois.close(); } catch(Exception ign){;}
            try { fis.close(); } catch(Exception ign){;}
        }
        if(validateMacaddress()==false) {
            f.delete();
            return false;
        }
        return true;
    }

    public void delete() {
        File f = new File(filename);
        f.delete();
    }
    
}
