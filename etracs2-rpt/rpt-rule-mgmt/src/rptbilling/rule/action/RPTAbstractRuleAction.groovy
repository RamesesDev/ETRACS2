
package rptbilling.rule.action;

import com.rameses.rcp.annotations.*
import com.rameses.rcp.common.*
import com.rameses.osiris2.client.*
import rulemgmt.*;

public abstract class RPTAbstractRuleAction extends RuleActionHandler {
    
    public abstract String buildDisplayText();
    public abstract String getActiontype();
    

    def account;

    def getAccountLookup() {
        return InvokerUtil.lookupOpener('incomeacct:lookup', null)
    }

    void setAccount( acct ) {
        this.account = acct;
        action.acctid = acct?.objid 
        action.accttitle = acct?.accttitle
    }


    def opener;

    public void init() {
        opener = InvokerUtil.lookupOpener( 'rule:formula_editor', [ handler:formulaModel ]);
        if( action.acctid ) {
            account = [accttitle: action.accttitle]
        }
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
