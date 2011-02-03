
package etracs2.municipality.transmittal;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.Map;

public class TransmittalWriter {
    
    private long firtEntryLength;
    private long lastEntryLength;
    
    private ObjectOutputStream writer;
    private String filename;
    
    private File tempFile;
    private File tempFileDir;
    private File tempAttachments;
    
    public TransmittalWriter(String filename) throws Exception{
        this.filename = filename;
        this.tempFileDir = new File(this.filename);
        this.tempFileDir.mkdir();
        this.tempAttachments = new File( this.tempFileDir.getAbsolutePath() + File.separator + "attachments" );
        tempAttachments.mkdir();
        this.tempFile = new File( tempFileDir.getAbsolutePath() + File.separator + tempFileDir.getName() +".txn" );
        open();
    }
    
    private void open() throws Exception{
        this.writer = new ObjectOutputStream( new BufferedOutputStream( new FileOutputStream( tempFile ) ));
    }
    
    public long write( Map map ) throws Exception{
        writer.writeObject( map );
        writer.flush();
        return tempFile.length();
    }
    
    public long writeAttachment( String name, byte[] bytes ){
        FileOutputStream bos = null;
        System.out.println("FILE NAME: " + name);
        File file = new File( tempAttachments.getAbsolutePath() + File.separator + name );
        
        try{
            if( bytes != null ){
                System.out.println("BYTES SIZE: " + bytes.length );
                if( !file.exists() ){
                    System.out.println("CREATING FILE: " + file.createNewFile() );
                }
                
                bos =  new FileOutputStream( file , true );
                bos.write( bytes );
                bos.flush();
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{ bos.close(); }catch(Exception ex){;}
        }
        return file.length();
    }
    
    public boolean integrityCheck(Map map){
        return true;
    }
    
    public void close(){
        try{ writer.close(); }catch(Exception ex){;}
    }
    
}
