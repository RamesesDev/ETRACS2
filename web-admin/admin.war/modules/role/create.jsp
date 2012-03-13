<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>

	<jsp:attribute name="script">
		$put( "create_role", 
			new function() {
				var svc = ProxyService.lookup("RoleclassService");
				var roleSvc = ProxyService.lookup("RoleService");
				
				var self = this;
		
				this.saveHandler;
				this.permissionHandler;
				this.role = { excluded: [] }
				this.roleClasses;
				this.mode = 'create';
		
				this.onload = function() {
					this.roleClasses = svc.getList( {} );
				}
		
				this.save = function() {
					this.role = roleSvc.create( this.role );
					if(this.saveHandler) this.saveHandler( this.role );
					this.mode = 'edit';
				}
				
				this.update = function() {
					this.role = roleSvc.update( this.role );
				}
				
				this.viewPermissions = function() {
					return this.permissionHandler( this.role.name );
				}
				
				this.propertyChangeListener = {
					'role.name' : function(value) {
						self.role.name = value.trim().replace(/\s+/, '_');
						self._controller.refresh();
					}
				}; 
			}
		);
	</jsp:attribute>

	<jsp:attribute name="leftactions">
		<ui:button context="create_role" action="save" caption="Save" visibleWhen="#{mode == 'create'}"/>
		<ui:button context="create_role" action="update" caption="Save" visibleWhen="#{mode != 'create'}"/>
		<ui:button context="create_role" action="viewPermissions" caption="Permissions" visibleWhen="#{mode != 'create'}"/>
	</jsp:attribute>
	
	<jsp:body>
		<div r:context="create_role" r:visibleWhen="#{mode == 'create'}">
			<ui:form context="create_role" object="role">
				<ui:combo name="roleclass" items="roleClasses" itemKey="name" itemLabel="description" caption="Role Class" allowNull="true" required="true"/>
				<ui:text name="name" required="true" caption="Name" style="width:350px;" maxlength="50" />
				<ui:textarea name="description" required="true" caption="Description" style="width:350px;height:50px"/>
			</ui:form>
		</div>
		<div r:context="create_role" r:visibleWhen="#{mode != 'create'}">
			<ui:form context="create_role" object="role">
				<ui:label caption="Role Class" rtexpression="true">#{role.roleclass}</ui:label>
				<ui:label caption="Name" rtexpression="true">#{role.name}</ui:label>
				<ui:textarea name="description" required="true" caption="Description" style="width:350px;height:50px"/>
			</ui:form>
		</div>
	</jsp:body>
</t:popup>
