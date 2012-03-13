<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Terminals">
	<jsp:attribute name="head">
		<script>
	
			$put( "terminal_list", 
				new function() {
					var svc = ProxyService.lookup( "TerminalService" );
		
					var self = this;
		
					this.selectedItem;
		
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							o.parentid = null;
							if( self.orgunit ) o.parentid = self.orgunit.objid;
							return svc.getList( o );	
						}
					}
		
					var reloadList = function() {
						self.listModel.refresh(true);	
					}
		
					this.add = function() {
						return new PopupOpener( "terminal:create", {saveHandler:reloadList, orgunit: self.orgunit} );
					}
					
					this.unassign = function() {
						if( confirm("You are about to unassign this terminal. Continue?")) {

						}	
					}
					
					this.orgunitList;
					this.orgunit;
					this.onload = function() {
						var osvc = ProxyService.lookup("OrgunitService");
						this.orgunitList = osvc.getUserOrgunits({});
					}
					
					this.propertyChangeListener = {
						"orgunit" : function(x) {
							reloadList();
						}
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="actions">
		<ui:button action="add" caption="Add" context="terminal_list"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="terminal_list">
			<ui:form>
				<ui:combo caption="Org Unit" items="orgunitList" name="orgunit" itemLabel="title" allowNull="true" emptyText="All org units"/>
			</ui:form>
			<ui:grid model="listModel" >
				<ui:col name="terminalid" caption="Terminal ID"/>
				<ui:col name="macaddress" caption="Mac Address"/>
				<ui:col name="parentcode" caption="Org Unit Assigned" align="center"/>
				<ui:col name="dtregistered" caption="Date Registered"/>
				<ui:col name="dtregistered" caption="Registered By"/>
				<ui:col>
					<a r:context="terminal_list" r:name="unassign" r:visibleWhen="#{!!item.macaddress}">Unassign</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
