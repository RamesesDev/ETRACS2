package rulemgmt;


public class RuleUtil {

    public static List getConstraintVars( rule, datatype=null, condition=null, collector=null ) {
        def list = [];
        if( !collector ) collector = { [name:it.fieldvar, info: it.fieldvar, datatype:it.field.datatype] }

        for( c in rule.conditions ) {
            if( condition != null && c.objid == condition.objid ) break;
            def items = c.constraints.findAll{ it.fieldvar && (datatype == null || it.field.datatype == datatype) }.collect( collector );
            list.addAll( items );
        }

        if( condition ) {
            def items = condition.constraints.findAll{ it.fieldvar && (datatype == null || it.field.datatype == datatype) }.collect( collector );
            list.addAll( items );
        }

        return list.unique();
    }

}