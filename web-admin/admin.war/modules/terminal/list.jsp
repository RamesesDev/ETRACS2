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
							return svc.getList( o );	
						}
					}
		
					var reloadList = function() {
						self.listModel.refresh(true);	
					}
		
					this.add = function() {
						MsgBox.prompt(
							"Enter the no. of terminal keys to generate", 
							function(text) {
								var size = parseInt(text);
								if( isNaN(size) ) return;
								svc.allocate( {size: size} );	
								reloadList();
							}
						);
					}
					
					this.unassign = function() {
						if( !this.selectedItem ) return;
						MsgBox.confirm(
							"You are about to unassign this terminal. Continue?",
							function(){
								svc.unregister( self.selectedItem );
								reloadList();
							}
						);
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
			<ui:grid model="listModel" >
				<ui:col name="terminalid" caption="Terminal ID"/>
				<ui:col name="macaddress" caption="Mac Address"/>
				<ui:col name="dtregistered" caption="Date Registered"/>
				<ui:col name="registeredby" caption="Registered By"/>
				<ui:col>
					<a r:context="terminal_list" r:name="unassign" r:visibleWhen="#{!!item.macaddress}">Unassign</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
