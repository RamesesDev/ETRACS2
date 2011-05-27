package etracs2.groovy;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.reports.*;

abstract class ReportController {
    @Binding
    def binding;
    
    def mode = "build";
    def entity = [];
    def data = [];
    
    abstract def getVarService();
    abstract def getDateService();
    abstract def getService();
    
    
    def view() {
       data = svc.buildReport( entity );
       if( !data ) throw new Exception("No results found.");
       report.viewReport();
       mode = 'view';
       return "preview";
    }
    
    def back(){
        mode = 'build';
        return "reportPage";
    }
        
    def report =[
        getReportName : { reportName(); },
        getReportData : { return data; },
        getParameters : { getStandardReportParams(); }
    ] as ServerReportModel;
    
    
    def getStandardReportParams() {
        def lguname = varService.get('lgu_name');
        if( lguname ){
            def lgutype = varService.get('lgu_type');
            if( lgutype == 'province' ) lguname = 'PROVINCE OF ' + lguname;
            else if( lgutype == 'city' ) lguname = 'CITY OF ' + lguname;
            else lguname = 'MUNICIPALITY OF ' + lguname;
        }
        
        def parentlguname = varService.get('parent_lgu_name');
        if( parentlguname ) parentlguname = 'PROVINCE OF ' + parentlguname;
        return [
            LOGOLGU     : varService.get('url_logo_lgu'),                    
            LOGOBLGF    : varService.get('url_logo_blgf'),                    
            LGUNAME     : lguname,
            PARENTLGUNAME : parentlguname,
            OFFICENAME  : varService.get('treasurer_office'),
            TREASURERNAME   : varService.get('treasurer_name'),
            TREASURERTITLE  : varService.get('treasurer_title'),
            TREASUREROFFICENAME  : varService.get('treasurer_office_name'),
            PRINTEDBY   : ( env.USERNAME ? env.USERNAME : 'SYSTEM' ),
            PRINTDATE   : dateService.getServerDate()
        ]; 
    }
    
    def getEnv() {
        return OsirisContext.env;
    }
}
