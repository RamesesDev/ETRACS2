/*
 * ValueHandler.java
 *
 * Created on April 10, 2012, 10:13 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

/**
 *
 * @author Elmo
 */
public abstract class ValueHandler {
    
    private Object rule;
    private Object value;
    private Object condition;
    private FactField factField;

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public Object getRule() {
        return rule;
    }

    public void setRule(Object rule) {
        this.rule = rule;
    }

    public Object getCondition() {
        return condition;
    }

    public void setCondition(Object condition) {
        this.condition = condition;
    }

    public FactField getFactField() {
        return factField;
    }

    public void setFactField(FactField factField) {
        this.factField = factField;
    }
    
    public String getDisplaytext() {
        return this.getValue()+"";
    }
    
}
