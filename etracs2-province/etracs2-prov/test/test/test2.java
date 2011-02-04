/*
 * MainTest.java
 * JUnit based test
 *
 * Created on November 25, 2010, 9:10 AM
 */

package test;


import com.rameses.common.AsyncResult;
import com.rameses.persistence.EntityManager;
import com.rameses.rcp.common.PageListModel;
import com.rameses.rcp.common.PopupOpener;
import com.rameses.rcp.common.SubListModel;
import com.rameses.rcp.common.Task;
import com.rameses.rcp.control.XTable;
import com.rameses.rcp.framework.ChangeLog;
import com.rameses.util.DateUtil;
import java.util.Date;
import java.util.Properties;
import junit.framework.*;

/**
 *
 * @author jzamss
 */
public class test2 extends TestCase {
    
    public test2(String testName) {
        super(testName);
    }

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }
    
    public void testMain() {
        Properties prop;
        prop = new Properties();
        PageListModel pl;
        SubListModel sl;
        ChangeLog cl;
        EntityManager em;
        
        Date dt = new Date();
        System.out.println(dt);
        System.out.println(DateUtil.add(dt, "-2m"));
        
    }

}
