<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="com" %>

<com:uid prefix="JOBP" var="UID" />

<t:popup>
	<jsp:attribute name="head">
		<script>		
		
			$put( "jobposition_create", 
				new function() {
					var svc = ProxyService.lookup("JobpositionService");
					this.saveHandler;
					this.jobposition;
					var self = this;
					
					this.selectedRoleclass;
						
					var roleSvc;
			
					this.onload = function() {
						this.jobposition.objid = "${UID}";
						this.jobposition.jobstatus = "R";
						this.jobposition.tags = [];
					}
					
					this.getRoleClasses = function() {
						var roleClassSvc = ProxyService.lookup("RoleclassService");
						return roleClassSvc.getList({});	
					}
			
					
			
					this.getRoles = function() {
						if( !this.selectedRoleclass ) return [];
						if( !roleSvc ) roleSvc = ProxyService.lookup("RoleService");
						return roleSvc.getRolesByClass( {roleclass: this.selectedRoleclass.name} );  
					}
			
					this.save = function() {
						this.jobposition = svc.create( this.jobposition );
						MsgBox.alert("Record successfully saved.");
						this.saveHandler();
						return "_close";
					}
					
					this.propertyChangeListener = {
						"selectedRoleclass" : function(x) {
							self.jobposition.roleclass = x.name;
							self.jobposition.tags = [];
						}
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="jobposition_create" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="jobposition_create">
			<ui:form>
				<ui:text name="jobposition.code" caption="Code"/>
				<ui:text name="jobposition.title" caption="Title" size="50"/>		
				<ui:radio name="jobposition.jobstatus" caption="Job Status" options="{R:'Regular', D:'Delegated'}"/>	
				<ui:combo name="selectedRoleclass" caption="Role Class" items="getRoleClasses()" allowNull="true" itemLabel="name"/>
				<ui:combo name="jobposition.role" caption="Role" items="getRoles()" allowNull="true" itemKey="name" itemLabel="name" depends="selectedRoleclass"/>
				
				<ui:label caption="Tags">
					<table r:context="${context}" r:items="selectedRoleclass.tags" r:varName="item" r:depends="selectedRoleclass"> 
						<tr>
							<td><input type="checkbox" r:context="${context}" r:name="jobposition.tags" r:mode="set" r:checkedValue="#{item}"/></td>
							<td>#{item}</td>
						</tr>
					</table>
				</ui:label>
			</ui:form>
		</ui:context>	
		
	</jsp:body>
</t:popup>
