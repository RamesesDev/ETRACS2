
package rptbilling.rule.action;

import com.rameses.rcp.annotations.*
import com.rameses.rcp.common.*
import com.rameses.osiris2.client.*
import rulemgmt.*;

public abstract class RPTAbstractDiscountRuleAction extends RuleActionHandler {
    
    public abstract String buildDisplayText();
    public abstract String getActiontype();
    
    def opener;

    public void init() {
        opener = InvokerUtil.lookupOpener( 'rule:formula_editor', [ handler:formulaModel ]);
    }

    public void accept() {
        action.displaytext = buildDisplayText()
    }

    def formulaModel = [
        getFields : { return [] },
        getVariables : { 
            return RuleUtil.getConstraintVars( rule );
        },
        getParameters : { return [] },
        getFunctions : { return [ [name:"IIF", info: "IIF Function"] ] },
        getExpr : { return action.expr },
        setExpr : { s-> action.expr = s; }
    ] as FormulaEditorModel;
    
}
