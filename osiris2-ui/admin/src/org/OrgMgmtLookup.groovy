package org;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.rcp.workspace.*;

public abstract class OrgMgmtLookup  {

    def parent;
    def parenttype;

    public abstract def getService();
    public abstract String getOrgType();

    def selection;

    public List getColumns() {
        return [
            new Column(name:"code", caption:"Code"),
            new Column(name:"name", caption:"Name"),
        ];
    }

    public List getList(o) {
        o.parentid = parent.objid;
        return service.getManagedList( o );  
    }

    def listHandler = [
        getColumns : {
            return getColumns();
        },
        fetchList: { o->
            return getList(o);
        }
    ] as PageListModel;


    public def launch() {
        def org = [id:selection.objid, code:selection.code,name:selection.name, type:orgType];
        org.OrgMgmtLauncher.launchAdminPanel( org );
        return "_close";
    }

}