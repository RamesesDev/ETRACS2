/*
 * RuleUI.java
 *
 * Created on April 6, 2012, 11:10 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package rulemgmt;

import com.rameses.util.TemplateProvider;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Elmo
 * This should be extended by the rule implementors
 *
 */
public abstract class RulesetHandler {
    
    abstract String getRuleset();
    
    public String getHtmlInfo( Object rule ) {
        Map m = new HashMap();
        m.put("rule", rule);
        return (String)TemplateProvider.getInstance().getResult( "templates/ruletext.gtpl", m );        
    }
    
}
