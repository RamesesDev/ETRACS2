/*
 * test2.java
 * JUnit based test
 *
 * Created on January 31, 2011, 10:55 AM
 */

package main.test;

import etracs2.municipality.transmittal.TransmittalWriter;
import java.util.HashMap;
import java.util.Map;
import junit.framework.*;

/**
 *
 * @author prmf
 */
public class test2 extends TestCase {
    
    public test2(String testName) {
        super(testName);
    }
    
    protected void setUp() throws Exception {
    }
    
    protected void tearDown() throws Exception {
    }
    
    // TODO add test methods here. The name must begin with 'test'. For example:
    public void testHello() throws Exception {
        TransmittalWriter writer = null;
        int count = 0;
        
        try{
            
            writer = new TransmittalWriter("C:/Documents and Settings/prmf/Desktop/faas");
            
            Map last = null;
            Map first = null;
            Map middle = null;
            int length = 1000;
            int mid = length / 2;
            
            for( int i=0; i < length; i++ ){
                String str = "DATA " + i;
                Map map = new HashMap();
                map.put("value", str);
                
                writer.write( map );
                
                if( count == 2000 ){
                    count = 0;
                    System.out.println("WRITING " + (i+1) + " of " + length );
                    Thread.sleep(1000);
                }
                
            }
            
            System.out.println( writer.integrityCheck( first ) );
            System.out.println( writer.integrityCheck( middle ) );
            System.out.println( writer.integrityCheck( last ) );
            
        }catch(Exception ex){
            throw ex;
        }finally{
            try{ writer.close(); }catch(Exception e){;}
        }
    }
    
}
