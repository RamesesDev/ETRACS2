package shared.crud;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.util.*;

public abstract class CrudList {

    @Binding
    def binding;

    public abstract List getColumns();
    public abstract List fetchList( def o );
    public abstract def createFormOpener();

    def mode = "read";
    def _selected;

    def queryOpener;
    def cacheMap;
    def _formOpener;

    public void setSelected( o ) {
        _selected = o;
        if(o) o =  fetchData(o.objid);
        if(formOpener?.handle) formOpener.handle.setSelected(o);
    }

    public def getFormOpener() {
        if(!_formOpener) _formOpener = createFormOpener();
        return _formOpener;
    }

    public def getSelected() {
        return _selected;
    }

    public def fetchData( id ) {
        if(!cacheMap)
            cacheMap = [ fetch: { oid->return formOpener?.handle?.open(oid); }  ] as CacheMap;
        return cacheMap[id];
    }

    def listHandler = [
        getColumns: { return getColumns(); },
        fetchList: { o->return fetchList(o); }
    ] as PageListModel;

     

    public void init() {
        /*
        formOpener = InvokerUtil.lookupOpener( orgType + ":form",
            [
                editHandler: { e,m->_selection=e; mode = m; binding.refresh(); },
                saveHandler: { e,m-> _selection=e; cacheMap.put(e.objid,e); mode = "read";binding.refresh();},
                cancelHandler: { e,m->_selection=e; mode = "read"; binding.refresh(); },
            ]);
        */    
    }

    


}