<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="cui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>

	<jsp:attribute name="style">
		.permission .row-header {
			padding-left: 0;
		}
		.permission td { border-right: solid 1px #ccc; }
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
			overflow: auto;
		}
		.selectionList td {
			padding: 2px;
			cursor: default;
		}
		.selectionList tr.selected {
			background-color: lightgrey;
			color:gray;	
			font-weight: bolder;
		}
	</jsp:attribute>

	<jsp:attribute name="script">
		
		$put("permission",
			new function() {
				this.selectedModule;
				this.selectedObject;
				this.selectedAction;
				
				var self = this;
				this.modules;
				this.saveHandler;
				
				this.title;
				this.onload = function() {
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
					}
				}

				this.save = function() {
					return this.saveHandler(this.modules);
				}
				
				this.toggleModule = function() {
					var allowed_count = this.selectedModule.allowed_count;
					var all_count = this.selectedModule.all_count;
					var v = (allowed_count == all_count) ? 0 : all_count;
					this.selectedModule.allowed_count = v;
					var allowed = (v==0) ? false : true;
					this.selectedModule.objects.each (
						function (_object) {
							_object.allowed_count = (allowed ==true) ? _object.all_count : 0;
							_object.actions.each (
								function(_action) { _action.allowed = allowed; }
							)
						}
					)
					self.objectListModel.refresh();
					self.permissionListModel.refresh();
				}

				this.toggleObject = function() {
					//ensure to clear first existing count in the selected object.
					var allowed_count = this.selectedObject.allowed_count;
					var all_count = this.selectedObject.all_count;
					var allowed = false;
					if( allowed_count == 0 ) {
						this.selectedObject.allowed_count = all_count;
						this.selectedModule.allowed_count += all_count;
						allowed = true;
					}
					else if( allowed_count == all_count) {
						this.selectedObject.allowed_count = 0;
						this.selectedModule.allowed_count -= all_count;
						allowed = false;
					}
					else {
						this.selectedModule.allowed_count -= allowed_count;
						this.selectedObject.allowed_count = all_count;
						this.selectedModule.allowed_count += all_count;
						allowed = true;
					}
					this.selectedObject.actions.each (
						function(z) { z.allowed = allowed; }
					);
					self.permissionListModel.refresh();
					self.moduleListModel.refresh();
				}
				
				this.togglePermission = function() {
					this.selectedAction.allowed = !this.selectedAction.allowed;
					var val = (this.selectedAction.allowed) ? 1 : -1;
					//change the status of the selected object
					self.selectedObject.allowed_count += val;

					//change the status of the selected module.
					self.selectedModule.allowed_count += val;
					
					self.objectListModel.refresh();
					self.moduleListModel.refresh();
				}
			}
		);
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button caption="Save" action="save" context="permission" />	
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="permission">
			<h2><label r:context="${context}" r:visibleWhen="#{title}">#{title}</label></h2>
			<ui:panel cols="3" width="100%" height="350px">
				<ui:section width="250px">
					<div id="label">Modules</div>
					<div class="selectionbox">
						<table r:context="${context}" r:model="moduleListModel" r:varName="item" r:name="selectedModule" 
							r:varStatus="stat"  width="100%" class="selectionList" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td width="20">
										<a r:context="${context}" r:name="toggleModule" r:visibleWhen="#{item.allowed_count == 0}">
											<img src="${pageContext.servletContext.contextPath}/img/unchecked.png"/>
										</a>
										<a r:context="${context}" r:name="toggleModule" r:visibleWhen="#{item.allowed_count==item.all_count}">
											<img src="${pageContext.servletContext.contextPath}/img/checked.png"/>
										</a>
										<a r:context="${context}" r:name="toggleModule" r:visibleWhen="#{!(item.allowed_count==item.all_count || item.allowed_count==0)}">
											<img src="${pageContext.servletContext.contextPath}/img/partial_checked.png"/>
										</a>
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
										<a r:context="${context}" r:name="toggleObject" r:visibleWhen="#{item.allowed_count==0}">
											<img src="${pageContext.servletContext.contextPath}/img/unchecked.png"/>
										</a>
										<a r:context="${context}" r:name="toggleObject" r:visibleWhen="#{item.allowed_count==item.all_count}">
											<img src="${pageContext.servletContext.contextPath}/img/checked.png"/>
										</a>
										<a r:context="${context}" r:name="toggleObject" r:visibleWhen="#{!(item.allowed_count==item.all_count || item.allowed_count==0)}">
											<img src="${pageContext.servletContext.contextPath}/img/partial_checked.png"/>
										</a>
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
										<a r:context="${context}" r:name="togglePermission" r:visibleWhen="#{item.allowed==true}">
											<img src="${pageContext.servletContext.contextPath}/img/checked.png"/>
										</a>
										<a r:context="${context}" r:name="togglePermission" r:visibleWhen="#{item.allowed!=true}">
											<img src="${pageContext.servletContext.contextPath}/img/unchecked.png"/>
										</a>
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
