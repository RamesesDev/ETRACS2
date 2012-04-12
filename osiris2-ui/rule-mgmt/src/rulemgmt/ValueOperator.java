/*
 * ValueOperator.java
 *
 * Created on April 10, 2012, 8:33 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

/**
 *
 * @author Elmo
 */
public class ValueOperator {
    
    private String symbol;
    private String caption;
    
    public ValueOperator(String s, String caption) {
        this.symbol = s;
        this.caption = caption;
    }

    public String getSymbol() {
        return symbol;
    }

    public String getCaption() {
        return caption;
    }
    
    
    
}
