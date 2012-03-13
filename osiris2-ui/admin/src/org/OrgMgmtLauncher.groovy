package org;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.rcp.workspace.*;

public static class OrgMgmtLauncher  {

    public static def launchAdminPanel( def org ) {
        def _env = OsirisContext.env;
        
        def permissionList = OsirisContext.session.securityProvider.permissions;

        if(_env.USER != 'root' ) {
            def p = [userid: _env.USERID, groupid: org.id ];
            def permService = InvokerProxy.instance.create("PermissionService");
            permissionList = permService.getManagementPermissions( p );
        }
    
        def env = [:];
        env.putAll( _env );
        env.ORG = org;
        def map = [:];
        map.env = env;

        map.permissions = permissionList;
        map.loaderType = "admin:subpanel";
        def c = Workspace.create( map );
        c.id = "ADMIN:"+env.ORG.id;
        c.show("ADMIN:"+ env.ORG.code); 
    }

}