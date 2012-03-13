<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="com" %>

<c:if test="${not empty param.objid}">
	<s:invoke service="JobpositionService" method="read" params="${param}" var="data"/>
</c:if>

<t:popup>
	<jsp:attribute name="head">
		<script>		
		
			$put( "jobpositioninfo", 
				new function() {
					var svc = ProxyService.lookup("JobpositionService");
					this.saveHandler;
					this.jobposition = <com:tojson value="${data}"/>;
					this.mode = "create";
			
					var roleClasses;
					var roleSvc;
			
					this.getRoleClasses = function() {
						if( !roleClasses ) {
							var roleClassSvc = ProxyService.lookup("RoleclassService");
							roleClasses = roleClassSvc.getList({});	
						}
						return roleClasses;
					}
			
					this.getRoles = function() {
						if( !this.jobposition.roleclass ) return [];
						if( !roleSvc ) roleSvc = ProxyService.lookup("RoleService");
						var list = roleSvc.getRolesByClass( {roleclass: this.jobposition.roleclass} );  
						return list;
					}
			
					this.save = function() {
						if(this.mode == "create") {
							this.jobposition = svc.create( this.jobposition );
							this.mode = "edit";
						}
						else {
							svc.update(this.jobposition);
						}
						this.saveHandler();
						MsgBox.alert("Record successfully saved.");
					}

					this.viewPermissions = function() {
						var jobid = this.jobposition.objid;
						var rsvc = ProxyService.lookup( "JobPermissionService" );	
						var result = rsvc.getPermissionsForAdmin({objid: jobid, role: this.jobposition.role });
						var params = {};
						params.modules = result.modules;
						params.title = "Job Position: (" + this.jobposition.code +") " + this.jobposition.title;
						params.saveHandler = function(x) {
							var p = {objid: jobid, modules: x };
							rsvc.updatePermissions( p );
							return "_close"; 
						};
						var p= new PopupOpener("admin:permission", params);
						p.title = "Job Role Permissions";
						return p;
					}
					
					this.listModel = {
						fetchList: function() {
							return svc.getTags( {jobid: self.jobposition.objid} );
						}
					};
					
					this.removeTag = function() {
						MsgBox.confirm(
							'Are you sure you want to remove this tag?',
							function() {
								svc.removeTag( self.selectedItem );
								self.listModel.load();
							}
						);
					}
					
					this.addTag = function() {
						var onSelect = function(o) {
							svc.addTag( {jobid: self.jobposition.objid, tagid: o.objid} );
							self.listModel.load();
						};
						return new PopupOpener('jobposition:tag_lookup',{selectHandler: onSelect});
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="jobpositioninfo" action="save" caption="Save"/>
		<ui:button context="jobpositioninfo" action="viewPermissions" caption="View Permissions" visibleWhen="#{mode!='create'}"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:form context="jobpositioninfo" object="jobposition">
			<ui:text name="code" caption="Code : "/>
			<ui:text name="title" caption="Title : " size="50"/>		
			<ui:radio name="jobstatus" caption="Job Status : " options="{R:'Regular', D:'Delegated'}"/>	
			<ui:combo name="roleclass" caption="Role Class : " items="getRoleClasses()" allowNull="true" itemKey="name" itemLabel="name"/>
			<ui:combo name="role" caption="Role : " items="getRoles()" allowNull="true" itemKey="name" itemLabel="name" depends="jobposition.roleclass"/>
		</ui:form>
		
		<div class="hr"></div>
		<h3>Tags</h3>
		<ui:context name="jobpositioninfo">
			<c:forEach items="${data.availableTags}" var="tag">
				<div>
					<label>
						<input type="checkbox" r:context="${context}" r:name="jobposition.tags" r:mode="set" r:checkedValue="${tag}"/>
						${tag}
					</label>
				</div>
			</c:forEach>
		</ui:context>
	</jsp:body>
</t:popup>
