<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Roles">
	<jsp:attribute name="head">
		<script>
	
			$put( "rolelist", 
				new function() {
					var roleClassSvc = ProxyService.lookup( "RoleclassService" );
					var svc = ProxyService.lookup( "RoleService" );
			
					var self = this;
			
					this.selectedItem;
					this.roleClasses; 
					this.roleClass;
			
					this.onload = function() {
						this.roleClasses = roleClassSvc.getList({});
					}
			
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							o.exclude_system = true;
							if( self.roleClass ) {
								o.roleclass = self.roleClass.name;
							}
							else {
								o.roleclass = null;
							}	
							return svc.getList( o );	
						}
					}
			
					var refreshList = function() {
						self.listModel.refresh(true);	
					}
			
					this.add = function() {
						return new PopupOpener( "role:create", {saveHandler:refreshList,permissionHandler:permissionHandler} );
					}
					
					this.edit = function() {
						return new PopupOpener( "role:create", {saveHandler:refreshList, permissionHandler:permissionHandler, mode:'edit', role: this.selectedItem} );
					}
					
					var permissionHandler = function( role ) {
						var rsvc = ProxyService.lookup( "RolePermissionService" );
						var result = rsvc.getPermissionsForAdmin({role: role }) ;
						var params = {};
						params.modules = result.modules;
						params.saveHandler = function(x) {
							var p = {role: role, modules: x };
							rsvc.updatePermissions( p );
							return "_close"; 
						};
						params.title = "Role : " + role;
						var p= new PopupOpener("admin:permission", params);
						p.title = "Role Permissions";
						return p;
					}

					this.viewPermissions = function() {
						return permissionHandler( this.selectedItem.name );
					}
			
					this.propertyChangeListener = {
						"roleClass" : function(o) {
							refreshList();
						}
					}
					
					this.removeRole = function() {
						if( confirm("You are about to remove this role. Continue?") ) {
							svc.remove( this.selectedItem );
							refreshList();
						}	
					}
					
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="actions">
		<ui:button action="add" caption="Add" context="rolelist"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="rolelist">
			<ui:form>
				<ui:combo caption="Role Classes : " items="roleClasses" 
				name="roleClass" itemLabel="name" allowNull="true" emptyText="All"/>
			</ui:form>
			<ui:grid model="listModel" name="selectedItem">
				<ui:col caption="Role" name="name"/>
				<ui:col caption="Role Class" name="roleclass"/>
				<ui:col caption="Description" name="description"/>
				<ui:col width="10">
					<a r:context="rolelist" r:name="edit">
						<img src="${pageContext.servletContext.contextPath}/img/edit.gif"/>
					</a>
				</ui:col>
				<ui:col width="10">
					<a r:context="rolelist" r:name="removeRole" title="Remove Role">
						<img src="${pageContext.servletContext.contextPath}/img/trash.gif"/>
					</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
		
