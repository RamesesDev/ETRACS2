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
		<h1>Upload Image here</h1>	
	</jsp:body>
</t:popup>

