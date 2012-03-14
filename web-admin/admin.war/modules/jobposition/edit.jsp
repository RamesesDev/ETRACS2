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
		
			$put( "jobposition_edit", 
				new function() {
					var svc = ProxyService.lookup("JobpositionService");
					this.saveHandler;
					
					this.jobposition = <com:tojson value="${data}"/>;
					this.availableTags;
					
					this.onload = function() {
						this.availableTags = this.jobposition.availableTags;
					}
					
					var roleSvc;
			
					this.getRoles = function() {
						if( !this.jobposition.roleclass ) return [];
						if( !roleSvc ) roleSvc = ProxyService.lookup("RoleService");
						var list = roleSvc.getRolesByClass( {roleclass: this.jobposition.roleclass} );  
						return list;
					}
			
					this.save = function() {
						svc.update(this.jobposition);
						this.saveHandler();
						MsgBox.alert("Record successfully saved.");
						return "_close";
					}

				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="jobposition_edit" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:form context="jobposition_edit" object="jobposition">
			<ui:text name="code" caption="Code"/>
			<ui:text name="title" caption="Title" size="50"/>		
			<ui:radio name="jobstatus" caption="Job Status" options="{R:'Regular', D:'Delegated'}"/>	
			<ui:label rtexpression="true" caption="Role class">#{jobposition.roleclass}</ui:label> 
			<ui:combo name="role" caption="Role : " items="getRoles()" allowNull="true" itemKey="name" itemLabel="name" depends="jobposition.roleclass"/>
			<ui:label caption="Tags">
					<table r:context="${context}" r:items="availableTags" r:varName="item"> 
						<tr>
							<td><input type="checkbox" r:context="${context}" r:name="jobposition.tags" r:mode="set" r:checkedValue="#{item}"/></td>
							<td>#{item}</td>
						</tr>
					</table>
			</ui:label>
		</ui:form>
	</jsp:body>
</t:popup>
