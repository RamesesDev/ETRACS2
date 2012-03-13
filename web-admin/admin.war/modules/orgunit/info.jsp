<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script>
		
			$put( "orgunitinfo", 
				new function() {
					var svc = ProxyService.lookup("OrgunitService");
					this.saveHandler;
					this.orgunit = {};
					this.mode = "create";
			
					this.save = function() {
						if(this.mode == "create") {
							svc.create( this.orgunit );
						}
						else {
							svc.update(this.orgunit);
						}
						this.saveHandler();
						return "_close";
					}
			
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<ui:button context="orgunitinfo" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:form context="orgunitinfo" object="orgunit">
			<ui:label caption="Type : " rtexpression="true">
				#{orgunit.orgtype}
			</ui:label>
			<ui:text caption="Code : " name="code" required="true"/>
			<ui:text caption="Title : " name="title" required="true" size="50"/>
		</ui:form>
	</jsp:body>
</t:popup>
