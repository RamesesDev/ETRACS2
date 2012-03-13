<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Job Positions">
	<jsp:attribute name="head">
		<script>
	
			$put( "jobpositionlist", 
				new function() {
					var svc = ProxyService.lookup( "OrgunitService" );
					var jobpossvc = ProxyService.lookup( "JobpositionService" );
			
					var self = this;
			
					this.selectedItem;
					this.orgUnits;
					this.orgUnit;
			
					this.onload = function() {
						this.orgUnits = svc.getUserOrgunits({});
					}
			
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							if(self.orgUnit) o.orgunitid = self.orgUnit.objid;
							return jobpossvc.getList( o );	
						}
					}
			
					var refreshList = function() {
						self.listModel.refresh(true);	
					}
			
					this.add = function() {
						return new PopupOpener( "jobposition:info", {saveHandler:refreshList, 
							jobposition : {orgunitid: this.orgUnit.objid, orgunitcode: this.orgUnit.code, jobstatus: "R" } } );
					}

					this.edit = function() {
						return new PopupOpener( "jobposition:info", {saveHandler:refreshList, objid:this.selectedItem.objid, mode:"edit" } );
					}
			
					this.propertyChangeListener = {
						orgUnit : function(o) { self.listModel.refresh(true); }
					}
			
					this.selectAssignee = function() {
						var h = function(x) {
							jobpossvc.assign( {objid: self.selectedItem.objid, assigneeid: x.objid } );
							refreshList();
						}
						return new DropdownOpener( "personnel:lookup" , {selectHandler: h});
					}
			
					this.removeAssignee = function() {
						if( confirm( "You are about to remove this assigned position. Continue?") ) {
							jobpossvc.unassign( {objid: self.selectedItem.objid  } );
							refreshList();
						}
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:body>
		<ui:context name="jobpositionlist">
			<ui:form>
				<ui:combo items="orgUnits" name="orgUnit" itemLabel="title" caption="Org Unit : " allowNull="true" emptyText="- Select an org unit -"/>
			</ui:form>
			<ui:button action="add" caption="Add"/>
			<ui:grid model="listModel" name="selectedItem">
				<ui:col name="code" caption="Code"/>
				<ui:col name="title" caption="Title"/>
				<ui:col caption="Assignee">
					<div r:context="jobpositionlist" r:visibleWhen="#{item.assignee == null}">
						<i>Vacant</i>
						<a r:context="jobpositionlist" r:name="selectAssignee">[Assign]</a>
					</div>
					<div r:context="jobpositionlist" r:visibleWhen="#{item.assignee != null}">
						<b>#{item.assignee}</b>
						<a r:context="jobpositionlist" r:name="removeAssignee"> [Unassign]</a>
					</div>
				</ui:col>
				<ui:col>
					<a r:context="jobpositionlist" r:name="edit">
						<img src="${pageContext.request.contextPath}/img/edit.gif"/>
					</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
