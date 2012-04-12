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
public interface FormulaEditorModel {
    
    List getFields();
    List getVariables();
    List getParameters();
    List getFunctions();
    
    String getExpr();
    void setExpr( String expr );
    
    
}
