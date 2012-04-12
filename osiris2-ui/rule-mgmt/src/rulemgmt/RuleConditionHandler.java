/*
 * RuleConditionHandler.java
 *
 * Created on April 7, 2012, 7:38 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

/**
 *
 * @author Elmo
 */
public abstract class RuleConditionHandler {
    
    private Object rule;
    private Object condition;
    
    /** Creates a new instance of RuleConditionHandler */
    public RuleConditionHandler() {
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
    
    //this is to be called prior to saving
    public abstract void  accept();
    public abstract String getConditiontype();
    
}
