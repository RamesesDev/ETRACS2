<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="cui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>

	<jsp:attribute name="style">
		.role_permission .row-header {
			padding-left: 0;
		}
		.role_permission td { border-right: solid 1px #ccc; }
		#label {
			font-weight:bolder;
			font-family:arial;
			font-size:12px;
		}
		.selectionbox {
			border: 1px solid lightgrey;
			background-color:white;
			height:350px;
			width:100%;
		}
		.selectionList td {
			padding: 2px;
		}
		.selectionList tr.selected {
			background-color: lightgrey;
			color:gray;	
			font-weight: bolder;
		}
	</jsp:attribute>

	<jsp:attribute name="script">
		$put("jobposition_permission",
			new function() {
			
				var svc = ProxyService.lookup( "JobPermissionService" );
				
				this.objid;
				this.role;
				
				this.modules;
				this.selectedModule;
				this.selectedObject;
				this.selectedAction;
				
				var self = this;
				this.disallowed = [];
				
				this.onload = function() {
					var r = svc.getPermissionsForAdmin({objid: this.objid, role: this.role }) ;
					this.modules = r.modules;
					this.disallowed = r.excluded;
					if( this.modules.length > 0 ) this.selectedModule = this.modules[0];
				}
				
				this.moduleListModel = {
					fetchList : function(x) {
						return self.modules;
					}
				}
				
				this.objectListModel = {
					fetchList: function(x) {
						if( !self.selectedModule) return [];
						var objectList = self.selectedModule.objects;
						if( objectList.length > 0 ) self.selectedObject = objectList[0];
						else self.selectedObject = null;
						return objectList;
					}
				}
				
				this.permissionListModel = {
					fetchList : function(x) {
						if( !self.selectedObject ) return []; 
						return self.selectedObject.actions;
					}
				}
				
				
				this.propertyChangeListener = {
					"selectedModule": function(o) {
						self.objectListModel.refresh(true);
						self.permissionListModel.refresh(true);
					},
					"selectedObject" : function(o) {
						self.permissionListModel.refresh(true);
					},
					"disallowed" : function(o) {
						var val = (o.checked) ? 1 : -1;
						
						//change the status of the selected object
						self.selectedObject.allowed_count += val;

						//change the status of the selected module.
						self.selectedModule.allowed_count += val;
						
						self.objectListModel.refresh();
						self.moduleListModel.refresh();
					}
				}

				this.save = function() {
					svc.updateDisallowed( {objid:this.objid, excluded: this.disallowed } );	
					return "_close";
				}
			}
		);
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button caption="Save" action="save" context="jobposition_permission" />	
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="jobposition_permission">
			<ui:panel cols="3" width="100%" height="350px">
				<ui:section width="220px">
					<div id="label">Modules</div>
					<div class="selectionbox">
						<table r:context="${context}" r:model="moduleListModel" r:varName="item" r:name="selectedModule" 
							r:varStatus="stat"  width="100%" class="selectionList" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="20">
										<label r:context="${context}" r:visibleWhen="#{item.allowed_count != item.all_count}">
											#{item.allowed_count == 0 ? '*0' : '*2'}
										</label>
										<label r:context="${context}" r:visibleWhen="#{item.allowed_count == item.all_count}">*1</label>
									</td>
									<td>#{item.title}</td>
								</tr>
							</tbody>
						</table>	
					</div>	
						
				</ui:section>
				<ui:section  width="220px">
					<div id="label">Entity Objects</div>	
					<div class="selectionbox">
						<table r:context="${context}" r:model="objectListModel" r:varName="item" r:name="selectedObject" 
							r:varStatus="stat" width="100%" class="selectionList"  cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="20">
										<label r:context="${context}" r:visibleWhen="#{item.allowed_count != item.all_count}">
											#{item.allowed_count == 0 ? '*0' : '*2'}
										</label>
										<label r:context="${context}" r:visibleWhen="#{item.allowed_count == item.all_count}">*1</label>
									</td>
									<td>#{item.title}</td>
								</tr>
							</tbody>
						</table>	
					</div>	
				</ui:section>
				<ui:section>
					<div id="label">Action/Permissions</div>
					<div class="selectionbox">
						<table r:context="${context}" r:model="permissionListModel" r:varName="item" r:varStatus="stat"  width="100%"
							 cellpadding="0" cellspacing="0" class="selectionList" r:name="selectedAction">
							<tbody>
								<tr>
									<td width="20">
										<input type="checkbox" r:context="${context}" r:name="disallowed"
											r:mode="set" r:uncheckedValue="#{item.id}" />
									</td>
									<td>#{item.title}</td>
								</tr>
							</tbody>
						</table>	
					</div>	
				</ui:section>
			</ui:panel>	
		</ui:context>	
	</jsp:body>
</t:popup>
