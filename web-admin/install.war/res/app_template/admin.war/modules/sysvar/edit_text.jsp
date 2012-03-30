<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script>
		
			$put( "sysvar_edit", 
				new function() {
					var svc = ProxyService.lookup( "Var");
					this.saveHandler;	
					this.info;
					
					this.save = function() {
						this.saveHandler(this.info);
						return "_close";
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="sysvar_edit" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="sysvar_edit">
			<ui:form object="info">
				<ui:label caption="Name" rtexpression="true">#{info.name}</ui:label>
				<ui:text caption="Value" name="value" style="width:300px" textcase="none"/>
				<ui:label caption="Description"  rtexpression="true">#{info.description}</ui:label>
			</ui:form>
		</ui:context>	
		
	</jsp:body>
</t:popup>

