package org;

import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;

public abstract class OrgLookup {

    public abstract def getService();
    public abstract def getBinding();
    public abstract String getOrgType();

    def parent;

    def excludes = [];
    def selectHandler;
    def selection;

    public List getColumns() {
        return [
            new Column(name:"code", caption:"Code"),
            new Column(name:"name", caption:"Name"),
        ];
    }
    

    def listHandler = [
        getColumns : { return getColumns(); }, 
        fetchList : { o->
            o.excludes = excludes;
            o.parentid = parent.objid;
            return service.getList( o );
        }
    ] as PageListModel;

    public def addNew() {
        return InvokerUtil.lookupOpener( orgType + ":create", 
            [   parent: parent, 
                saveHandler: saveHandler,
                cancelHandler: { return "_close";} 
            ] );
    }

    public boolean getCanCreate() {
        return OsirisContext.session.securityProvider.checkPermission( "admin:" + orgType?.toLowerCase() + ".create" );
    }

    def saveHandler = { o,mode->
        selectHandler( o ); 
        return "_exit";
    }

    public def doSelect() {
        if(!selection)
            throw new Exception("Please select an item"); 
        selectHandler( selection ); 
        return "_exit";
    }
}
