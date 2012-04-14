/*
 * FactField.java
 *
 * Created on April 10, 2012, 7:52 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

/**
 *
 * @author Elmo
 *
 * This is used for the condition handler. 
 */
public class FactField {
    
    private String name;
    private String datatype;
    private String caption;
    private String operatorHandler;
    private String valueHandler;
    
    public static String STRING = "string";
    public static String DECIMAL = "decimal";
    public static String INTEGER = "integer";
    public static String DATE = "date";
    public static String BOOLEAN = "boolean";
    
    public FactField(String name, String caption, String datatype) {
        this(name,caption,datatype,null,null);
    }

    public FactField(String name, String caption, String datatype, String operatorHandler, String valueHandler ) {
        this.name = name;
        this.datatype = datatype;
        this.caption = caption;
        this.operatorHandler = operatorHandler;
        if( this.operatorHandler == null ) {
            if( datatype.equals("integer")) this.operatorHandler = "number";
            else if( datatype.equals("decimal")) this.operatorHandler = "number";
            else if( datatype.equals("date")) this.operatorHandler = "number";
            else if( datatype.equals("boolean")) this.operatorHandler = "boolean";
            else this.operatorHandler = "string";
        }
        this.valueHandler = valueHandler;
        if( this.valueHandler == null ) {
            this.valueHandler = datatype;
        }
    }
    
    public String getName() {
        return name;
    }

    public String getDatatype() {
        return datatype;
    }

    public String getCaption() {
        return caption;
    }

    public String getOperatorHandler() {
        return operatorHandler;
    }

    public String getValueHandler() {
        return valueHandler;
    }
    
    
    
}
