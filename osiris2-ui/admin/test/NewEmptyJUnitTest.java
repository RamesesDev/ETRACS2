import junit.framework.*;
/*
 * NewEmptyJUnitTest.java
 * JUnit based test
 *
 * Created on December 7, 2010, 2:32 PM
 */

/**
 *
 * @author ms
 */
public class NewEmptyJUnitTest extends TestCase {
    
    public NewEmptyJUnitTest(String testName) {
        super(testName);
    }

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }
    
    // TODO add test methods here. The name must begin with 'test'. For example:
    public void testHello() {
        Double d = new Double(16.2);
        Double d1 = new Double(2.0);
        System.out.println(d / d1 / d1); 
    }

}
