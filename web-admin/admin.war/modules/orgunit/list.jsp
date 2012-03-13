<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Organization Units">
	<jsp:attribute name="head">
		<script>
		
			$put( "orgunitlist", 
				new function() {
					var svc = ProxyService.lookup( "OrgunitService" );
			
					var self = this;
			
					this.selectedItem;
					this.orgTypes;
					this.orgType;
			
					this.onload = function() {
						this.orgTypes = svc.getOrgtypes();
						if(this.orgTypes && this.orgTypes.length > 0 ) {
							this.orgType = this.orgTypes[0];
						}
					}
			
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							o.orgtype = self.orgType;
							return svc.getList( o );	
						}
					}
			
					var refreshList = function() {
						self.listModel.refresh(true);	
					}
			
					this.add = function() {
						return new PopupOpener( "orgunit:info", {saveHandler:refreshList, orgunit : {orgtype: this.orgType } } );
					}

					this.edit = function() {
						return new PopupOpener( "orgunit:info", {saveHandler:refreshList, orgunit:this.selectedItem, mode:"edit" } );
					}
			
					this.propertyChangeListener = {
						orgType : function(o) { self.listModel.refresh(true); }
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:body>
		<ui:context name="orgunitlist">
			<ui:form>
				<ui:combo name="orgType" items="orgTypes" itemKey="name" itemLabel="name"/>
			</ui:form>
			<ui:button action="add" caption="Add"/>
			<ui:grid model="listModel" name="selectedItem">
				<ui:col caption="Code" name="code" width="20%"/>
				<ui:col caption="Title" name="title" width="60%"/>
				<ui:col >
					<a r:context="orgunitlist" r:name="edit">View</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
			
		
