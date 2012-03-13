package org;

import com.rameses.rcp.common.*;
import com.rameses.util.*;
import com.rameses.osiris2.client.*;

public abstract class OrgList  {

    public abstract def getService();
    public abstract def getBinding();
    public abstract String getOrgType();
    public abstract void setFormTitle(String t);
    public abstract void setFormId( String t ); 

    def cacheMap;

    def parent;
    def _selection;
    def formOpener;
    def mode = "read";

    public List getColumns() {
        return [
            new Column(name:"code", caption:"Code",  width:100, maxWidth:100),
            new Column(name:"name", caption:"Name")
        ]
    }

    public void init() {
        cacheMap = [ fetch: { id-> return service.open([objid:id]); }  ] as CacheMap;
        setFormTitle( orgType + ":" + parent.code );
        setFormId( orgType + ":" + parent.objid );
        formOpener = InvokerUtil.lookupOpener( orgType + ":form",
            [
                parent: parent,
                editHandler: { e,m->_selection=e; mode = m; binding.refresh(); },
                saveHandler: { e,m-> _selection=e; cacheMap.put(e.objid,e); mode = "read";binding.refresh();},
                cancelHandler: { e,m->_selection=e; mode = "read"; binding.refresh(); },
            ]);
    }

    public void setSelection(o) {
         _selection = o;
         formOpener.handle.data = (o) ? cacheMap[o.objid] : null ;
    }

    public def getSelection() {
        return _selection;
    }

    def listHandler = [
        getColumns: { return getColumns(); },
        fetchList: { o->
            o.parentid = parent.objid;
            return service.getList( o );
        }
    ] as PageListModel;

}

        