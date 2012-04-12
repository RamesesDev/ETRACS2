/*
 * Constraint.java
 *
 * Created on April 10, 2012, 11:29 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Elmo
 */
public class Constraint {
    
    private FactField field;
    private String fieldvar;
    private ValueOperator operator;
    private boolean usevar;
    private Object value; 
    private String displaytext;
    
    public Constraint() {
    }

    public FactField getField() {
        return field;
    }

    public void setField(FactField field) {
        this.field = field;
    }

    public String getFieldvar() {
        return fieldvar;
    }

    public void setFieldvar(String fieldvar) {
        this.fieldvar = fieldvar;
    }

    public ValueOperator getOperator() {
        return operator;
    }

    public void setOperator(ValueOperator operator) {
        this.operator = operator;
    }

    public boolean isUsevar() {
        return usevar;
    }

    public void setUsevar(boolean usevar) {
        this.usevar = usevar;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getDisplaytext() {
        return displaytext;
    }

    public void setDisplaytext(String displaytext) {
        this.displaytext = displaytext;
    }
    
    public Map toMap() {
        Map map = new HashMap();        
        if( field != null ) {
            Map f = new HashMap();
            f.put("name", field.getName());
            f.put("caption", field.getCaption());
            f.put("datatype", field.getDatatype());
            f.put("operatorHandler", field.getOperatorHandler());
            f.put("valueHandler", field.getValueHandler());
            map.put("field", f);
        }
        map.put("fieldvar", fieldvar);
        if( operator != null ) {
            Map o = new HashMap();
            o.put("name", operator.getSymbol());
            o.put("caption", operator.getCaption());
            map.put("operator", o);
        }
        map.put("value", value);
        map.put("displaytext", displaytext);
        map.put("usevar", usevar);
        return map;
    }
    
    public void rebuild(Map data) {
        Map m = (Map) data.get("field");
        if( m != null ) {
            String name = (String) m.get("name");
            String caption = (String) m.get("caption");
            String datatype = (String) m.get("datatype");
            String oh = (String) m.get("operatorHandler");
            String vh = (String) m.get("valueHandler");
            this.field = new FactField( name, caption, datatype, oh, vh );
        }
        this.fieldvar = (String) data.get("fieldvar");
        m = (Map) data.get("operator");
        if( m != null ) {
            String s = (String) m.get("name");
            String c = (String) m.get("caption");
            this.operator = new ValueOperator( s, c );
        }
        this.value = m.get("value");
        this.displaytext = (String) m.get("displaytext");
        this.usevar = (Boolean) m.get("usevar");
    }
    
}
