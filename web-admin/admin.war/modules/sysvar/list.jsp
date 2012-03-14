<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="System Variables">
	<jsp:attribute name="head">
		<script>
	
			$put( "sysvar_list", 
				new function() {
					var svc = ProxyService.lookup( "Var" );
					var self = this;
					this.selectedItem;
		
					this.listModel = {
						rows: 15,
						fetchList: function(o) {
							return svc.getAllVariables(o);	
						}
					}
		
					this.reloadList = function() {
						self.listModel.refresh(true);	
					}
					
					this.edit = function() {
						var h = function(x) {
							svc.set( x.name, x.value );
							self.reloadList();
						}
						return new PopupOpener( "sysvar:edit", {info:this.selectedItem, saveHandler: h } );
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="actions">
		<ui:button action="add" caption="Add" context="sysvar_list"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="sysvar_list">
			<ui:grid model="listModel" >
				<ui:col name="name" caption="Name"/>
				<ui:col name="value" caption="Value"/>
				<ui:col name="description" caption="Description"/>
				<ui:col>
					<a r:context="sysvar_list" r:name="edit">
						Edit
					</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
