<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Personnel Information">
	<jsp:attribute name="head">
		<link href="${pageContext.request.contextPath}/js/ext/menu/menu.css" rel="stylesheet"/>
		<script src="${pageContext.request.contextPath}/js/ext/menu/menu.js"></script>
		
		<style>
			.headmenu {
				padding:4px;
				padding-right:8px;
				padding-left:8px;
				color:black;
				font-size:11px;
			}
			.headmenu_selected {
				background-color:red;
				padding:4px;
				padding-right:8px;
				padding-left:8px;
				color:white;
				font-size:11px;
			}
		</style>

		<script>
			$put( "personnelinfo", 
				new function() 
				{
					var svc = ProxyService.lookup( "PersonnelService" );
					var self = this;
					this.info =  <s:invoke service="PersonnelService" method="read" params="${pageContext.request}" json="true" />;
					
					this.positionListModel = {
						fetchList: function(p) {
							return svc.getPositions( self.info.objid );
						}
					}
					
					this.selectedPosition;
					this.unassignPosition = function() {
						if( confirm("You are about to unassign this position. Continue?") ) {
							var psvc = ProxyService.lookup("JobpositionService");		
							psvc.unassign( {objid: this.selectedPosition.objid } );
							this.positionListModel.refresh(true);
						}
					}
					
					this.viewPermissions = function() {
						var jobid = this.selectedPosition.objid;
						var rsvc = ProxyService.lookup( "JobPermissionService" );	
						var result = rsvc.getPermissionsForAdmin({objid: jobid, role: this.selectedPosition.role });
						var params = {};
						params.modules = result.modules;
						params.saveHandler = function(x) {
							var p = {objid: jobid, modules: x };
							rsvc.updatePermissions( p );
							return "_close"; 
						};
						var p= new PopupOpener("admin:permission", params);
						p.title = "Job Role Permissions";
						return p;
					}
					
					this.useraccount;
					this.removeLogin = function() {
						if( confirm("Are you sure you want to remove this login account?") )
						{
							var usvc = ProxyService.lookup("UserAccountService");
							usvc.remove( this.useraccount );
							this.useraccount = null;
							self.menus.setSelectedIndex(0);
							return 'default';
						}
					}
					
					this.viewUserAccount = function() {
						if(!this.useraccount) {
							var usvc = ProxyService.lookup( "UserAccountService" );		
							this.useraccount = usvc.getAccount( {objid:this.info.objid} );
							if( !this.useraccount ) {
								if( confirm("This person does not have a login account yet. Create now?")) {
									var info  = {
										objid: this.info.objid,
										lastname: this.info.lastname,
										firstname: this.info.firstname,
										middlename: this.info.middlename,
										usertype: "personnel",
										email: this.info.email
									}
									var h = function(x) {
										self.useraccount = usvc.createLoginAccount(x);	
									}
									return new PopupOpener( "personnel:useraccount", {saveHandler:h, info: info} );
								}
								else {
									return null;
								}
							}
						}
						return "useraccount";
					}
					
					this.edit = function() {
						var h = function() {
							self._controller.refresh();
						}
						return new PopupOpener( "personnel:edit", {saveHandler:h, info: this.info} );
					}
					
					this.menus = {
						fetchMenus: function() {
							return [
								{id:"info", caption:"Information"},
								{id:"position", caption:"Position"},
								{id:"acct", caption:"User Account"}
							];
						},
						fetchChildren: function(o) {
							if( o.id == 'info' )
								return [{id:"edit", caption:"Edit", icon:"${pageContext.servletContext.contextPath}/img/edit.gif"}];
						},
						onclick: function( o ) {
							if( o.id == "info" )
								return "_default";
							if( o.id == "position" )
								return "_positions";
							if( o.id == "acct" )
								return self.viewUserAccount();
							if( o.id == "edit" )
								return self.edit();
							
							return null;
						}
					};
					
				},
				{
					"default": "modules/personnel/info_data.jsp",
					"positions": "modules/personnel/info_positions.jsp",
					"useraccount": "modules/personnel/info_useraccount.jsp",
				}
			);
		</script>

	</jsp:attribute>

	<jsp:body>
		<div r:type="menu" r:context="personnelinfo" r:model="menus" r:orientation="horizontal"></div>		
		<div r:controller="personnelinfo"> </div>		
	</jsp:body>
</t:content>
