package system.tools.ui;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.util.*;
import com.rameses.osiris2.*;
import com.rameses.osiris2.client.*;


public class QuickLaunchHelper 
{
    private static def instance;
    
    public static def getInstance() {
        return instance? instance : (instance = new QuickLaunchHelper());
    }
    
    private def invokers;
    private def allInvokers;

    private void indexInvokers() {
        invokers = [:];
        def list = OsirisContext.session.getInvokers("quick_launcher");
        def code;
        list.each{
            code = it.properties.code;
            if( code && !invokers[code.toUpperCase()] ) {
                invokers[code.toUpperCase()] = it;
            }
        };
    }

    public void launch( key ) {
        if( invokers == null ) indexInvokers();

        def inv = invokers[key];
        if( inv ) 
            InvokerUtil.invoke( inv );
        else
            MsgBox.alert("Lancher key not available.");
    }

    /**
     * displays all quick_launcher invokers
     * displays the code, desc(description), and allowed(yes or no)
     */
    public def getAllLaunchers() {
        if( invokers == null ) indexInvokers();

        if( allInvokers == null ) {
            allInvokers = [];
            def code;
            AppContext.instance.invokers.each {
                if( it.type != "quick_launcher" ) return;

                code = it.properties.code;
                if( code ) {
                    code = code.toUpperCase();
                    allInvokers << [
                        code: code,
                        desc: it.properties.desc? it.properties.desc : it.caption, 
                        allowed: invokers[code]? "Yes" : "No"
                    ];
                }
            };

            allInvokers.unique{ it.code }
        }

        return allInvokers;
    }
}
