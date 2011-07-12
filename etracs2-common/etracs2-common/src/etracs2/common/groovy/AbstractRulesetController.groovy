package etracs2.common.groovy
        

import com.rameses.rcp.annotations.*
import com.rameses.rcp.common.*
import com.rameses.osiris2.client.*

public abstract class AbstractRulesetController 
{
    abstract def getBinding()
    abstract def getAbstractRuleService()
    abstract String getRuleset()
    abstract String getOpenerName()
    
    def searchText
    def selectedItem 
    def list = []
    
    void init() {
        search()
    }
    
    def create() {
        return InvokerUtil.lookupOpener(openerName+'.create', [ruleset:ruleset])
    }
    
    def updateHandler = {
        binding.refresh('html')
    }
    
    def open() {
        def rule = abstractRuleService.open( selectedItem.objid )
        def opener = rule.opener + '.open' 
        println 'Opener -> ' + opener
        return InvokerUtil.lookupOpener(opener, [rule:rule, updateHandler:updateHandler])
    }
    
    void remove() {
        if( MsgBox.confirm('Delete rule?') ) {
            abstractRuleService.remove( selectedItem.objid )
            list.remove( selectedItem )
            listHandler.load()
        }
    }
    
    void search() {
        list = abstractRuleService.getList( ruleset, searchText, null )
        listHandler.load()
    }
    
    def listHandler = [
        getColumns   : {
            return [
                new Column(name:'docstate', caption:'State', maxWidth:80 ),
                new Column(name:'agendagroup', caption:'Group', maxWidth:120),
                new Column(name:'rulename', caption:'Rule Name'),
                new Column(name:'author', caption:'Author', maxWidth:120),
                new Column(name:'salience', caption:'Salience', maxWidth:80 ),
            ]
        },
        fetchList : { return list },
        onOpenItem : {item, colname -> open() }
    ] as PageListModel
    
    def getHtml() {
        abstractRuleService.getHtml( selectedItem?.objid )
    }
    
    /*------------------------------------------------------------------
    * Opener Handlers
    ------------------------------------------------------------------*/
    def addHandler = { rule ->
        int index = list.indexOf( selectedItem )
        if( index >= 0 ) {
            list.insert( index, rule )
        }
        else {
            list.add( rule )
        }
        binding.refresh('selectedItem')
    }
    
    
    /*------------------------------------------------------------------
    * RuleSet Handlers
    ------------------------------------------------------------------*/
    void setSelectedRuleset( selectedItem ) {
        this.selectedItem = selectedItem
        ruleset = selectedItem?.properties.ruleset
        search()
    }
    
    def getRulesets() {
        return InvokerUtil.lookupOpeners('ruleset', null)
    }
}