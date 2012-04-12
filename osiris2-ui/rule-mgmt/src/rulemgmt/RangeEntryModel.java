/*
 * FormulaModel.java
 *
 * Created on April 9, 2012, 7:20 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

import java.util.List;

/**
 *
 * @author Elmo
 */
public interface RangeEntryModel {
    
    List getVariables();
    void setVariable(Object o);
    Object getVariable();
    List getItems();
    
}
