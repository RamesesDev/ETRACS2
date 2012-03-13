package shared.crud;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;

public abstract class CrudForm {

    @Binding
    def binding;

    def entity;
    def mode = "read";

    public abstract def open(def id);
    
    public def saveUpdate() {
        throw new Exception("saveUpdate() is not implemented"); 
    }

    public def saveCreate() {
        throw new Exception("saveCreate() is not implemented");
    }


    public void setSelected( def s ) {
        entity = s;
        binding.refresh();
    }

    public def createEntity() {
        mode = "create";
        return [:];
    }

    public void create() {
        entity = createEntity();
        mode = "new";
    }

    public List getFormActions() {
        return [];
    }

    public def edit() {
        mode = "edit";
        return null;
    }

    public def cancelEdit() {
        mode = "read";
        return null;
    }

    public def save() {
        def result = null;
        if( mode == "create" ) {
            result =  saveCreate();
        }
        else {
            result =  saveUpdate();
        }
        mode = "read";
        return result;
    }

}