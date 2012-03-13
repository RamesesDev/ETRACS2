import com.rameses.osiris2.client.OsirisContext;
import com.rameses.osiris2.reports.DynamicReportModel;
import java.util.List;
import junit.framework.*;

/*
 * Test.java
 * JUnit based test
 *
 * Created on August 10, 2010, 5:22 PM
 * @author jaycverg
 */

public class Test extends TestCase {
    
    public Test(String testName) {
        super(testName);
    }
    
    public void test() 
    {
        
    }
    
    private class M extends DynamicReportModel {
        public List getColumns() {
            List retValue;
            
            retValue = super.getColumns();
            return retValue;
        }
        
    }
    
}
