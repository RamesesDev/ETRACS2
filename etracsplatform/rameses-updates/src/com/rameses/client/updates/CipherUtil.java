/*
 * CipherUtil.java
 *
 * Created on August 13, 2009, 5:32 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.rameses.client.updates;

import java.io.Serializable;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SealedObject;
import javax.crypto.SecretKey;

/**
 *
 * @author elmo
 */
public final class CipherUtil {
    
    private CipherUtil() {
    }
    
    public static Object encode( Serializable obj ) throws Exception {
        SecretKey sk = KeyGenerator.getInstance("DES").generateKey();
        Cipher enc = Cipher.getInstance("DES");
        enc.init(Cipher.ENCRYPT_MODE, sk);
        SealedObject so = new SealedObject(obj, enc);
        return  new Object[]{sk, so};
    }
    
    public static Object decode( Serializable obj ) throws Exception {
        Object[] o = (Object[])obj;
        if( o.length != 2  ) throw new Exception( "Error secured parameter count");
        SecretKey sk = (SecretKey) o[0];
        SealedObject so = (SealedObject) o[1];
        Cipher dec = Cipher.getInstance("DES");
        dec.init(Cipher.DECRYPT_MODE, sk);
        return so.getObject(dec);
    }
    
    
}
