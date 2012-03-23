package etracs2.common.groovy

import com.rameses.rcp.annotations.*
import com.rameses.rcp.common.*
import com.rameses.osiris2.client.*

abstract class AbstractRuleController
{
    def mode
    def rule
    def selectedCondition
    def selectedAction
    def agendagroup
    def agendalist 
    int editedIndex    
            
    abstract def getBinding()
    abstract def getAbstractRuleService()
    abstract def getRuleService()
    abstract String getOpenerName()
    abstract String getPackagename()
    abstract String getRuleset()
    void setRuleset( ruleset ) { }
    
    
    void create() {
        rule = abstractRuleService.createRule( openerName, packagename, ruleset )
        agendagroup = null
        binding?.focus('rule.rulename')
        mode = 'create' 
    }
    
    void copy() {
        mode = 'create' 
        binding?.focus('rule.rulename')
    }
    
    void edit() {
        mode = 'edit' 
    }
    
    void cancel() {
        rule = abstractRuleService.open( rule.objid )
        mode = 'view' 
    }
    
    void open() {
        agendagroup = findAgendaGroup()
        mode = 'view'
    }
    
    void save() {
        
        rule.ruletext = ruleService.buildRuleText( rule )
        if( mode == 'create' ) 
            rule = abstractRuleService.create( rule )
        else 
            rule = abstractRuleService.update( rule )
        mode = 'view'
    }
    
    void deploy() {
        if( MsgBox.confirm('Deploy rule?') ) {
            rule = abstractRuleService.deploy( rule.objid )
        }
    }
    
    void undeploy() {
        if( MsgBox.confirm('Undeploy rule?') ) {
            rule = abstractRuleService.undeploy( rule.objid )
        }
    }
    
    def remove() {
        if( MsgBox.confirm('Delete rule?') ) {
            abstractRuleService.remove( rule.objid )
            return '_close' 
        }
    }
    
    def debug() {
        return InvokerUtil.lookupOpener('rule.debug',[rule:rule])
    }
    
    
    /* -----------------------------------------------------------
    * Condition Support
    * ----------------------------------------------------------- */
    
    def addConditionHandler = { condition ->
        rule.conditions.add( condition )
        doBuildVarList()
        conditionListHandler.load()
    }
    
    def addCondition() {
        fixRuleName()
        return InvokerUtil.lookupOpener('abstractrulecondition.create',[
                abstractRuleSvc : abstractRuleService, 
                ruleSvc         : ruleService, 
                openerName      : openerName,
                addHandler      : addConditionHandler, 
                varlist         : rule.varlist
        ])
    }

    def updateConditionHandler = { condition ->
        rule.conditions.set(editedIndex, condition )
        selectedCondition = condition
        doBuildVarList()
        conditionListHandler.load()
    }
    
    void doBuildVarList() {
        buildVarList().each {
            if( ! rule.varlist.contains( it ) ) {
                rule.varlist.add( it )
            }
        }   
    }

    void doRemoveVar(){
        selectedCondition.constraints.each{
            rule.varlist.remove( it.fieldvar )
        }
    }
    
    def openCondition() {
        editedIndex = rule.conditions.indexOf( selectedCondition )
        def conditionOpener = selectedCondition.opener + '.open'
        def opener = InvokerUtil.lookupOpener(conditionOpener, [condition:selectedCondition])
        return InvokerUtil.lookupOpener('abstractrulecondition.open', [
                abstractRuleSvc : abstractRuleService, 
                ruleSvc         : ruleService, 
                openerName      : openerName,
                rule            : rule, 
                condition       : selectedCondition, 
                updateHandler   : updateConditionHandler
        ])        
    }
    
    void removeCondition() {
        if( ! selectedCondition ) return 
        doRemoveVar()
        rule.conditions.remove( selectedCondition )
    }
    
    def conditionListHandler = [
        getRows     : { return 50 },
        getColumns  : { 
            return [ new Column(name:'displaytext', caption:'') ]
        },
        fetchList   : { return rule.conditions },
        onOpenItem  : { item, colname ->  openCondition() },
    ] as SubListModel
    
    List buildVarList() {
        def varlist = []
        rule.conditions.each {cond ->
            if( cond.factvar ) varlist.add( cond.factvar )
            cond.constraints.each { 
                if( it.fieldvar ) varlist.add( it.fieldvar )
            }
        }
        return varlist
    }
    
    /* -----------------------------------------------------------
    * Action Support
    * ----------------------------------------------------------- */
    
    def addActionHandler = { action ->
        rule.actions.add( action )
        actionListHandler.load()
    }
    
    def addAction() {
        fixRuleName()
        return InvokerUtil.lookupOpener('abstractruleaction.create',[
                abstractRuleSvc : abstractRuleService, 
                ruleSvc         : ruleService, 
                openerName      : openerName,
                rule            : rule, 
                addHandler      : addActionHandler
        ])
    }
    
    def updateActionHandler = { action -> 
        rule.actions.set(editedIndex, action )
        selectedAction = action 
        actionListHandler.load()
    }
    
    def openAction() {
        editedIndex = rule.actions.indexOf( selectedAction )
        def actionOpener = selectedAction.opener + '.open'
        def opener = InvokerUtil.lookupOpener(actionOpener, [rule:rule, varlist:rule.varlist.unique(), action:selectedAction])
        return InvokerUtil.lookupOpener('abstractruleaction.open', [
                abstractRuleSvc : abstractRuleService, 
                ruleSvc         : ruleService, 
                openerName      : openerName,
                rule            : rule, 
                opener          : opener, 
                action          : selectedAction, 
                updateHandler   : updateActionHandler
        ])        
    }
    
    void removeAction() {
        if( ! selectedAction ) return 
        rule.actions.remove( selectedAction )
    }
    
    def actionListHandler = [
        getRows     : { return 50 },
        getColumns  : { 
            return [ new Column(name:'displaytext', caption:'') ]
        },
        fetchList   : { return rule.actions },
        onOpenItem  : { item, colname ->  openAction() },
        
    ] as SubListModel
    
    
    /* -----------------------------------------------------------
    * Miscellaneous Support
    * ----------------------------------------------------------- */
    
    void setAgendagroup( agendagroup )  {
        this.agendagroup = agendagroup
        rule.agendagroupid = agendagroup?.objid 
        rule.agendagroup = agendagroup?.name
    }
    
    def getAuthor() {
        def author = OsirisContext?.env?.USERNAME
        return (author ? author : 'SYSTEM')
    }
    
    def getAgendaGroups() {
        if( ! agendalist  )
            agendalist = ruleService.getAgendaGroups()
        return agendalist
    }
    
    def findAgendaGroup() {
        return agendaGroups.find{ it.objid == rule.agendagroupid }
    }
    
    def fixRuleName( ) {
        rule.rulename = rule.rulename.replaceAll('\\W', '_')
        binding.refresh('rule.rulename')
    }
    
    /*------  caller refresh support --------*/
    def refreshHandler;
    def updateHandler;
    
    @Close
    void onClose() {
        if( refreshHandler ) 
            refreshHandler()
        else if( updateHandler )
             updateHandler( rule )
    }
    
}
