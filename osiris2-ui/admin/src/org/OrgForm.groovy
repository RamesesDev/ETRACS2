package org;

import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;

public abstract class OrgForm  {

    public abstract def getService();
    public abstract def getBinding();
    public abstract String getOrgType();

    def entity;
    def parent;
    def editHandler;
    def saveHandler;
    def cancelHandler;

    def oldEntity;
    def mode = "read";
    def rowSelector = [handler:null];

    public def getFormActions() {
        def  _formActions =  InvokerUtil.lookupActions( orgType + ":formActions", 
                { return [ parent:entity,  parenttype: orgType, rowSelector: rowSelector ] } as InvokerParameter  );
        return _formActions.findAll{ isActionVisible( it.name ) };
    }

    public def setData(def e) {
        entity = e;
        binding.refresh();
        if(rowSelector.handler) rowSelector.handler(entity);
    }

    public def create() {
        mode = "create";
        entity = [:];
        entity.parentid = parent.objid;
        entity.parentcode = parent.code;
        entity.parenttype = parent.type;
        if(editHandler) editHandler(entity, mode);
    }

    public def edit() {
        mode = "edit";
        oldEntity = entity;
        entity = service.open( [objid:entity.objid] );
        if(editHandler) return editHandler(entity, mode);
    }

    public def cancelEdit() {
        if(MsgBox.confirm("Changes will be discarded. Continue?")) {
            def oldMode = mode;
            mode = "read";
            entity = oldEntity;
            if(cancelHandler) return cancelHandler(entity, oldMode);
        }
    }

    public def save() {
        if(MsgBox.confirm("You are about to save this record. Continue?")) {
            if(mode=="create")
                entity = service.create(entity);
            else
                entity = service.update(entity);
            def oldMode = mode;
            mode = "read";
            if(saveHandler) return saveHandler(entity, oldMode);
        }
    }

    //PERMISSIONS
    public boolean getCanCreate() {
        def type = parent.type;
        if(type == 'root')  type = 'admin';
        return OsirisContext.session.securityProvider.checkPermission( type + ":" + orgType?.toLowerCase() + ".create" );
    }

    public boolean getCanEdit() {
        def type = parent.type;
        if(type == 'root')  type = 'admin';
        return OsirisContext.session.securityProvider.checkPermission( type + ":" + orgType?.toLowerCase() + ".edit" );
    }

    public boolean isActionVisible( String action ) {
        if(mode!='read' || entity?.objid==null) return false;
        def type = parent.type;
        if(type == 'root')  type = 'admin';
        return OsirisContext.session.securityProvider.checkPermission( type + ":" + orgType?.toLowerCase() + "." + action );
    }

}