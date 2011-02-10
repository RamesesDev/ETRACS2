
package etracs2.prov.transmittal;

import com.rameses.io.FileTransferInfo;
import com.rameses.io.FileTransferInputStream;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.HashMap;
import java.util.Map;

public class TransmittalReader {
    
    private ObjectInputStream ois;
    private File folder;
    private int index = 0;
    private File attachments;
    private File[] files;
    
    private File file;
    
    public TransmittalReader(String folder) throws Exception{
        this.folder = new File( folder );
        this.attachments = new File( this.folder.getAbsolutePath() + File.separator + "attachments");
        this.file = new File( this.folder.getAbsolutePath() + File.separator + this.folder.getName() +".txn" );
        check();
        open();
    }
    
    private void check() throws Exception {
        if( !this.folder.exists() ) throw new Exception("Transmittal folder not found.");
        if( !this.attachments.exists() ) throw new Exception("Not valid a transmittal folder.");
        if( !this.file.exists() ) throw new Exception("Not valid a transmittal folder.");
        
        files = attachments.listFiles();
    }
    
    private void open() throws Exception{
        this.ois = new ObjectInputStream( new BufferedInputStream( new FileInputStream( file ) ) );
    }
    
    public Map read( Map chunk ) throws Exception{
        
        if( chunk.get("state").equals("TRANSMITTAL") ){
            chunk.put("data", ois.readObject() );
        }else{
            
            FileTransferInputStream ftis = null;
            try{
                File file = getAttachment( index );
                chunk.put("attachments", files.length);
                System.out.println("ATTACHMENTS SIZE: " + files.length );
                if( file != null ){
                    ftis = new FileTransferInputStream( file );
                    ftis.setByteSize( 1024 * 32 );
                    
                    byte[] bytes = ftis.readNext();
                    
                    FileTransferInfo info = ftis.getFileTransferInfo();
                    info.save();
                    
                    Map data = new HashMap();
                    data.put("bytes", bytes );
                    data.put("filename", file.getName());
                    data.put("eof", info.isEof() );
                    chunk.put("data", data );
                    
                    if( info.isEof() ) {
                        
                        info.delete();
                        index = index + 1;
                        
                        if( getAttachment( index ) == null ) chunk.put("eof", true);
                        
                    }
                    
                    System.out.print("{FILENAME: " + file.getName() +", ");
                    System.out.print(", BYTE READ: " + info.getBytesRead() + " ");
                    System.out.print( ", SIZE: " + bytes.length +"]\n");
                }else{
                    chunk.put("eof", true);
                }
            }catch(Exception ign){
                ign.printStackTrace();
            }finally{
                try{ ftis.close(); }catch(Exception ign){;}
            }
        }
        
        return chunk;
    }
    
    public void close() throws Exception{
        try{ ois.close(); }catch(Exception ign){;}
    }
    
    private File getAttachment( int index ) throws Exception{
        if( index < files.length ) return files[index];
        return null;
    }
}
