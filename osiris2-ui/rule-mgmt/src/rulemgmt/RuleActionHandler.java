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
public abstract class RuleActionHandler {
    
    private Object rule;
    private Object action;
    
    /** Creates a new instance of RuleConditionHandler */
    public RuleActionHandler() {
    }

    public Object getRule() {
        return rule;
    }

    public void setRule(Object rule) {
        this.rule = rule;
    }

    public Object getAction() {
        return action;
    }

    public void setAction(Object action) {
        this.action = action;
    }

    //this is to be called prior to saving
    public abstract void accept();
    public abstract String getActiontype();
}
