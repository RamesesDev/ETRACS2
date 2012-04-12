/*
 * FactConditionHandler.java
 *
 * Created on April 10, 2012, 9:47 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

import com.rameses.osiris2.client.InvokerUtil;
import com.rameses.rcp.common.MsgBox;
import com.rameses.rcp.common.Opener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Elmo
 */
public abstract class FactConditionHandler extends RuleConditionHandler {
    
    public abstract String getFactname();
    public abstract FactField[] getFields();
    
    
    private FactField selectedField;
    private String fieldvar;
    private ValueOperator selectedOperator;
    private boolean usevar;
    private Opener valueHandler;
    private Map selectedConstraint;
    
    public String getConditiontype() {
        return getFactname();
    }
    
    public FactField getSelectedField() {
        return selectedField;
    }
    
    public void setSelectedField(FactField selectedField) {
        this.selectedField = selectedField;
    }
    
    public String getFieldvar() {
        return fieldvar;
    }
    
    public void setFieldvar(String fieldvar) {
        this.fieldvar = fieldvar;
    }
    
    public ValueOperator getSelectedOperator() {
        return selectedOperator;
    }
    
    public void setSelectedOperator(ValueOperator selectedOperator) {
        this.selectedOperator = selectedOperator;
    }
    
    public boolean isUsevar() {
        return usevar;
    }
    
    public void setUsevar(boolean usevar) {
        this.usevar = usevar;
    }
    
    public ValueOperator[] getOperators() {
        if( selectedField == null )
            return new ValueOperator[]{};
        Opener o = InvokerUtil.lookupOpener( "value_operator:" + selectedField.getOperatorHandler(), null );
        if( o == null )
            return new ValueOperator[]{};
        ValueOperatorHandler vh = (ValueOperatorHandler)o.getHandle();
        return vh.getOperators();
    }
    
    public Opener getValueHandler() {
        if( selectedField == null )
            return null;
        if(selectedOperator == null )
            return null;
        
        valueHandler = null;
        Map params = new HashMap();
        params.put("rule", super.getRule());
        params.put("factField", this.selectedField);
        params.put("condition", super.getCondition());
        if( usevar ) {
            valueHandler = InvokerUtil.lookupOpener( "value_handler:variable", params );
        } else {
            valueHandler = InvokerUtil.lookupOpener( "value_handler:" + selectedField.getValueHandler(), params );
        }

        return valueHandler;
    }
    
    public void addConstraint() throws Exception {
        if( selectedField == null )
            throw new Exception("Please select a field");
        if( selectedOperator == null && (fieldvar == null||fieldvar.trim().length()==0) )
            throw new Exception("Please specify a variable name or a value to compare");
        if(selectedOperator!=null && valueHandler == null ) {
            throw new Exception("Please specify a value");
        }
        
        Map m = (Map)super.getCondition();
        List list = (List)m.get("constraints");
        if(list==null) {
            list = new ArrayList();
            m.put( "constraints", list );
        }
        
        StringBuffer dp = new StringBuffer();
        if( fieldvar!=null ) dp.append( fieldvar + ": ");
        dp.append( selectedField.getName());
        if(selectedOperator !=null && valueHandler != null) {
            ValueHandler vh = (ValueHandler) valueHandler.getHandle();
            dp.append( " " + selectedOperator.getSymbol() + " " + vh.getDisplaytext() );
        }
        
        Constraint entry = new Constraint();
        entry.setDisplaytext( dp.toString() );
        
        //values that needs to be stored
        entry.setField( selectedField );
        entry.setFieldvar( fieldvar );
        entry.setOperator( selectedOperator );
        entry.setUsevar( usevar );
        if( valueHandler != null ) {
            ValueHandler vh = (ValueHandler) valueHandler.getHandle();
            entry.setValue( vh.getValue() );
        }
        
        list.add( entry.toMap() );
        
        this.selectedField = null;
        this.selectedOperator = null;
        this.usevar = false;
        this.fieldvar = null;
        this.valueHandler = null;
    }
    
    public Map getSelectedConstraint() {
        return selectedConstraint;
    }
    
    public void setSelectedConstraint(Map selectedConstraint) {
        this.selectedConstraint = selectedConstraint;
    }
    
    public void removeConstraint() {
        Map m = (Map)super.getCondition();
        List<Map> list = (List)m.get("constraints");
        if(list!=null) {
            list.remove( this.selectedConstraint );
        }
    }
    
    public void init() {
    }
    
    public void accept() {
        StringBuffer sb = new StringBuffer();
        sb.append( getFactname() );
        sb.append("(");
        Map cond = (Map) super.getCondition();
        List list = (List) cond.get("constraints");
        boolean first = true;
        for(Object o : list) {
            Map m = (Map) o;
            if( !first ) 
                sb.append(", ");
            else
                first = false;
            
            sb.append(m.get("displaytext"));
        }
        sb.append(")");
        
        cond.put("displaytext", sb.toString());
        cond.put("factname", getFactname());
    }

}
